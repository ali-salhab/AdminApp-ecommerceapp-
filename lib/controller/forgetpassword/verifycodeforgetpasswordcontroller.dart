import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/view/screens/forgetpassword/verifycodeforgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../data/datasource/remote/forgetpassword/verifycodedata.dart';

// ignore: camel_case_types
abstract class Verifycodeforgetpasswordcontroller extends GetxController {
  gotoresetpassword(String code);
}

class VerifycodeforgetpasswordImp extends Verifycodeforgetpasswordcontroller {
  Statusrequest statusrequest = Statusrequest.none;
  String? email;
  Verifycodedata verifycodedata = Verifycodedata(Get.find());

  @override
  gotoresetpassword(String code) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await verifycodedata.postdata(email!, code);

    statusrequest = handlingdata(response);
    print("response.................$response");

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        print("response.................$response");
        Get.toNamed(AppRoutes.resetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(title: "Error", middleText: "not vaild code ");
        //here every thing ok but no data where pounded
        statusrequest = Statusrequest.failure;
      }
    }

    update();
    // Get.toNamed(AppRoutes.resetpassword);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}
