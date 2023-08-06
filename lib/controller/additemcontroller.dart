import 'dart:io';

import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/core/constants/route.dart';
import 'package:adminapp/core/functions/handlingdata.dart';
import 'package:adminapp/core/functions/uploadfile.dart';
import 'package:adminapp/data/datasource/remote/categoriesdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddItemController extends GetxController {}

class AddItemControllerImp extends AddItemController {
  bool checkval = true;
  File? file = null;
  TextEditingController? namear;
  TextEditingController? nameen;
  Statusrequest statusrequest = Statusrequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CategoriesData catdata = CategoriesData(Get.find());

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
    namear = TextEditingController();
    nameen = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
  // 



