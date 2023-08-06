import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constants/route.dart';
import 'package:adminapp/core/functions/handlingdata.dart';
import 'package:adminapp/data/datasource/remote/categoriesdata.dart';
import 'package:adminapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CategoriesController extends GetxController {}

class CategoriesControllerImp extends CategoriesController {
  Statusrequest statusrequest = Statusrequest.none;

  CategoriesData catdata = CategoriesData(Get.find());
  List data = [];
  deletecat(String imagename, String id) async {
    await catdata.deletecat(imagename, id);
    getdata();
    update();
  }

  gotoeditcat(cat) {
    Get.toNamed(AppRoutes.editcategorie, arguments: {"cat": cat});
  }

  getdata() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await catdata.getdata();

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        data = response['data'];
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  gotoaddnewcategorie() {
    Get.toNamed(AppRoutes.addcategorie);
  }

  @override
  void onInit() async {
    await getdata();
    // TODO: implement onInit
    super.onInit();
  }
}
