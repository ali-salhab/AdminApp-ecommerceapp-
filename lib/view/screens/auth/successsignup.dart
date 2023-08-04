import 'package:ecommerceapp/controller/auth/successsignupcontroller.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/view/widget/auth/customauthbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignupControllerImp controller =
        Get.put(SuccessSignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Text(
          'Success Signup',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColors.black, fontFamily: 'playfair'),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: AppColors.primarycolor,
              size: 230,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width - 30,
              child: CustomAuthButton(
                text: 'Continue',
                onPressed: () {
                  controller.gotologinpage();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
