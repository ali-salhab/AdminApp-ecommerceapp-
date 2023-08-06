import 'dart:io';

import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constants/route.dart';
import 'package:adminapp/core/functions/handlingdata.dart';
import 'package:adminapp/data/datasource/remote/categoriesdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategorieController extends GetxController {
  Map? data;

  File? file = null;
  TextEditingController? namear;
  TextEditingController? nameen;
  Statusrequest statusrequest = Statusrequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CategoriesData catdata = CategoriesData(Get.find());
  editcat() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await catdata.editcat(nameen!.text, namear!.text,
          data!['categories_image'], data!['categories_id']);

      statusrequest = handlingdata(response);

      if (statusrequest == Statusrequest.success) {
        if (response['status'] == 'success') {
          Get.toNamed(AppRoutes.categories);
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
    data = Get.arguments['cat'];
    print(" ------------------------$data");
    // TODO: implement onInit
    super.onInit();
  }
}
