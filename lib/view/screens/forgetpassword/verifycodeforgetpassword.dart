import 'package:ecommerceapp/controller/forgetpassword/resetpasswordcontroller.dart';
import 'package:ecommerceapp/controller/auth/verifycodecontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/view/widget/auth/customauthbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/forgetpassword/forgetpasswordcontroller.dart';
import '../../../controller/auth/signupcontroller.dart';
import '../../../controller/forgetpassword/verifycodeforgetpasswordcontroller.dart';
import '../../widget/auth/customtextformfield.dart';
import '../../widget/auth/logo.dart';
import '../../widget/auth/textsignup.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifycodeForgetpassword extends StatelessWidget {
  const VerifycodeForgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    VerifycodecontrollerImp controller = Get.put(VerifycodecontrollerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Text(
            'Verify Code',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.black, fontFamily: 'playfair'),
          ),
        ),
        body: GetBuilder<VerifycodecontrollerImp>(
          builder: (controller) {
            return Handlingdataview(
                statusrequest: controller.statusrequest,
                widget: Container(
                  margin: const EdgeInsets.all(35),
                  child: ListView(
                    children: [
                      // const LogoAuth(),
                      Text(
                        'Enter Verify code that were sended to your entered email',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      OtpTextField(
                          textStyle: TextStyle(fontSize: 19),
                          borderRadius: BorderRadius.circular(12),
                          focusedBorderColor: AppColors.primarycolor,
                          enabledBorderColor: AppColors.grey,
                          borderColor: Colors.black,
                          borderWidth: 5,
                          showFieldAsBox: true,
                          fieldWidth: 50,
                          numberOfFields: 4,
                          onSubmit: (String code) async {
                            {
                              var status =
                                  await controller.getverifycodestatus(code);
                              print(Get.previousRoute);
                              print('===============>$status');
                              if (Get.previousRoute.toString() == "/signup") {
                                print("sssssssssfrom condeitionssssssssss");
                                if (status.toString() == "true") {
                                  print("correct code ");

                                  Get.offAllNamed(AppRoutes.login);
                                } else {
                                  Get.snackbar("error", "wrong verify code");
                                }
                              }
                              if (Get.previousRoute == "/forgetpassword") {
                                if (status.toString() == "true") {
                                  Get.offAllNamed(AppRoutes.resetpassword,
                                      arguments: {
                                        "email": controller.email.toString()
                                      });
                                } else {
                                  Get.snackbar("error", "wrong verify code");
                                }
                              }
                            }
                          }),

                      const SizedBox(
                        height: 15,
                      ),

                      // CustomAuthButton(
                      //   text: 'Reset Password',
                      //   onPressed: () {
                      //     controller.gotoresetpage();
                      //   },
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ));
          },
        ));
  }
}
