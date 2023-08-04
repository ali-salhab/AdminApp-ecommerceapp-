import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/forgetpassword/resetpassworddata.dart';

abstract class Resetpasswordcontroller extends GetxController {
  changepassword();
}

class ResetpasswordcontrollerImp extends Resetpasswordcontroller {
  ResetPasswordData resetpassworddata = ResetPasswordData(Get.find());
  late TextEditingController firstpassword;
  late TextEditingController secondpassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Statusrequest statusrequest = Statusrequest.none;
  late String email;

  @override
  changepassword() async {
    print("-------------1----------------");
    if (formstate.currentState!.validate()) {
      if (firstpassword.text == secondpassword.text) {
        statusrequest = Statusrequest.loading;
        update();
        print(email);
        var response =
            await resetpassworddata.postdata(email, firstpassword.text);

        statusrequest = handlingdata(response);

        if (statusrequest == Statusrequest.success) {
          if (response['status'] == 'success') {
            Get.offAllNamed(AppRoutes.login);
            Get.snackbar(
                'success', 'successfully password changed try to login',
                dismissDirection: DismissDirection.horizontal,
                duration: Duration(seconds: 3),
                backgroundColor: AppColors.primarycolor);
          } else {
            Get.defaultDialog(title: "Error", middleText: "passsword ");
            //here every thing ok but no data where pounded
            // statusrequest = Statusrequest.failure;
          }
        }

        update();
      } else {
        Get.defaultDialog(
            title: "Erorr", middleText: "passwords not correct ot");
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    firstpassword = TextEditingController();
    secondpassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstpassword.dispose();
    secondpassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
