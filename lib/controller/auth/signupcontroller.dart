import 'package:ecommerceapp/controller/auth/verifycodecontroller.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/colors.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/auth/signup_data.dart';

abstract class Signupcontroller extends GetxController {
  signup();
  gotosignin();
  gotosuccesssignup();
}

class SignupcontrollerImp extends Signupcontroller {
  GlobalKey<FormState> formstatesignup = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController username;
  SignupData signupdata = SignupData(Get.find());
  List data = [];
  Statusrequest? statusrequest;
  @override
  gotosignin() {
    Get.offNamed(AppRoutes.login);
  }

  gotoverifycode() {
    // Get.toNamed(AppRoutes.verifycode, arguments: {'email': email.text});
  }

  gotosuccesssignup() {
    Get.offAllNamed(AppRoutes.successsignup);
  }

  @override
  signup() async {
    if (formstatesignup.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await signupdata.postdata(
          username.text.toString(),
          phone.text.toString(),
          email.text.toString(),
          password.text.toString());

      statusrequest = handlingdata(response);

      if (statusrequest == Statusrequest.success) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          Get.toNamed(AppRoutes.verifycodeforgetpassword,
              arguments: {'email': email.text});

          Get.snackbar('success', 'enter verify code sended to :${email.text}',
              dismissDirection: DismissDirection.horizontal,
              duration: Duration(seconds: 3),
              backgroundColor: AppColors.primarycolor);
        } else {
          Get.defaultDialog(
              title: "Error ", middleText: "phone or email is existed");
          //here every thing ok but no data where pounded
          statusrequest = Statusrequest.failure;
        }
      }

      update();
    } else {
//not valid data
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    phone = TextEditingController();

    username = TextEditingController();

    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    super.dispose();
  }
}
// import 'package:ecommerceapp/core/class/statusrequest.dart';
// import 'package:ecommerceapp/data/datasource/remote/test_data.dart';
// import 'package:get/get.dart';

// import '../core/functions/handlingdata.dart';

// class Testcontroller extends GetxController {
//   TestData testdata = TestData(Get.find());
//   List data = [];
//   late Statusrequest statusrequest;
//   getdata() async {
//     statusrequest = Statusrequest.loading;
//     var response = await testdata.getdata();

//     statusrequest = handlingdata(response);
//     if (statusrequest == Statusrequest.success) {
//       if (response['status'] == 'success') {
//         data.addAll(response['data']);
//       } else {
//         statusrequest = Statusrequest.failure;
//       }
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     getdata();
//     super.onInit();
//   }
// }
