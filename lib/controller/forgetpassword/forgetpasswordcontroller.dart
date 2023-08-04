import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/route.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/forgetpassword/forgetpassworddata.dart';

abstract class Forgetpasswordcontroller extends GetxController {
  gotoverifycode();
}

class ForgetpasswordcontrollerImp extends Forgetpasswordcontroller {
  @override
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey();
  Statusrequest? statusrequest = Statusrequest.none;
  ForgetpasswordData forgetpasswordData = ForgetpasswordData(Get.find());
  @override
  gotoverifycode() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await forgetpasswordData.postdata(email.text);

      statusrequest = handlingdata(response);

      if (statusrequest == Statusrequest.success) {
        if (response['status'] == 'success') {
          Get.toNamed(AppRoutes.verifycodeforgetpassword,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Error",
              middleText: "email not registered ... try to login ");
          //here every thing ok but no data where pounded
          // statusrequest = Statusrequest.failure;
        }
      }

      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
