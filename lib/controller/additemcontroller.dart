import 'dart:io';

import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/core/constants/route.dart';
import 'package:adminapp/core/functions/handlingdata.dart';
import 'package:adminapp/core/functions/uploadfile.dart';
import 'package:adminapp/data/datasource/remote/categoriesdata.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddItemController extends GetxController {}

class AddItemControllerImp extends AddItemController {
  bool checkval = true;

  List<SelectedListItem> categories = [];
  File? file = null;
  TextEditingController? namear;
  TextEditingController? nameen;
  TextEditingController? descar;
  TextEditingController? descen;
  TextEditingController? discount;
  TextEditingController? count;
  TextEditingController? price;

  TextEditingController? catname;
  TextEditingController? catid;
  String active = '1';

  Statusrequest statusrequest = Statusrequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CategoriesData catdata = CategoriesData(Get.find());
  getCategories() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await catdata.getdata();

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List c = response['data'];

        for (int i = 0; i < c.length; i++) {
          categories.add(SelectedListItem(
              name: c[i]['categories_name'], value: c[i]['categories_id']));
        }
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  chooseimage() async {
    file = await fileuploadgalllery(issvg: true);
    update();
  }

  additem() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        return Get.defaultDialog(
            title: "Error",
            titleStyle: TextStyle(color: Colors.red),
            backgroundColor: Color.fromARGB(225, 206, 191, 193),
            content: Text(
              "Please select image",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24),
            ),
            buttonColor: AppColors.primarycolor,
            onConfirm: () {
              Get.back();
            });
      }
      statusrequest = Statusrequest.loading;
      update();
      var response = await catdata.addcat(nameen!.text, namear!.text, file!);

      statusrequest = handlingdata(response);

      if (statusrequest == Statusrequest.success) {
        if (response['status'] == 'success') {
          print("success cat added");
          statusrequest = Statusrequest.success;
          Get.offAllNamed(AppRoutes.homepage);
        } else {
          statusrequest = Statusrequest.failure;
          update();
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    getCategories();
    namear = TextEditingController();
    nameen = TextEditingController();
    descar = TextEditingController();
    descen = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    price = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();

    super.onInit();
  }
}
  // 



