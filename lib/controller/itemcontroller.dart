import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/core/constants/route.dart';
import 'package:adminapp/core/functions/handlingdata.dart';
import 'package:adminapp/data/datasource/remote/categoriesdata.dart';
import 'package:adminapp/data/datasource/remote/itemsdata.dart';
import 'package:adminapp/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {}

class ItemsControllerImp extends ItemsController {
  Statusrequest statusrequest = Statusrequest.none;

  ItemsData catdata = ItemsData(Get.find());

  CategoriesData cat = CategoriesData(Get.find());
  List data = [];
  List cate = [];

  TextEditingController? catname;
  TextEditingController? catid;
  List<SelectedListItem> categories = [];
  // deletecat(String imagename, String id) async {
  //   await catdata.deletecat(imagename, id);
  //   getdata();
  //   update();
  // }
  gotoeditpage(Map dataitem) {
    Get.toNamed(AppRoutes.edititem,
        arguments: {"data": dataitem, 'cate': cate, "categories": categories});
  }

  getCategories() async {
    print("---------------------get categories---------------");
    statusrequest = Statusrequest.loading;
    update();
    var response = await cat.getdata();

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List c = response['data'];

        for (int i = 0; i < c.length; i++) {
          categories.add(SelectedListItem(
              name: c[i]['categories_name'], value: c[i]['categories_id']));
          cate.add(
              {"name": c[i]['categories_name'], "id": c[i]['categories_id']});
        }
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  deleteitem(id, imagename) async {
    catdata.deleteitem(id, imagename);
    Get.defaultDialog(
        buttonColor: AppColors.primarycolor,
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black,
        title: "Warning",
        content: Text("Are you Sure to delete this item "),
        onCancel: () {},
        onConfirm: () {
          catdata.deleteitem(id, imagename);
          data.removeWhere((element) => element['item_id'] == id);
          Get.back(closeOverlays: true, canPop: false);
          update();
        });
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

  gotoaddnewitem() {
    Get.toNamed(AppRoutes.additem);
  }

  @override
  void onInit() {
    getdata();
    getCategories();
    // TODO: implement onInit
    super.onInit();
  }
}
