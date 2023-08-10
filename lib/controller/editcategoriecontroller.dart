import 'dart:io';

import 'package:adminapp/controller/categoriescontroller.dart';
import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constants/route.dart';
import 'package:adminapp/core/functions/handlingdata.dart';
import 'package:adminapp/data/datasource/remote/categoriesdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategorieController extends GetxController {
  Map? data;
  CategoriesControllerImp catcon = Get.find();
  File? file = null;
  TextEditingController? namear;
  TextEditingController? nameen;
  Statusrequest statusrequest = Statusrequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CategoriesData catdata = CategoriesData(Get.find());
  editimage() {
    update();
  }

  editcat() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await catdata.editcat(nameen!.text, namear!.text,
          data!['categories_image'], data!['categories_id'],
          file: file);

      statusrequest = handlingdata(response);

      if (statusrequest == Statusrequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.categories);
          catcon.getdata();
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
    namear = TextEditingController();
    nameen = TextEditingController();
    data = Get.arguments['cat'];
    namear!.text = data!['categories_name_ar'];
    nameen!.text = data!['categories_name'];
    print(" ------------------------$data");
    // TODO: implement onInit
    super.onInit();
  }
}
