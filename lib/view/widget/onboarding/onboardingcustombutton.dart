import 'package:ecommerceapp/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';

class CustomButtonOnboarding extends GetView<OnboardingControllerImp> {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        width: 300,
        decoration: BoxDecoration(
            color: AppColors.primarycolor,
            borderRadius: BorderRadius.circular(10)),
        child: MaterialButton(
            onPressed: () {
              controller.next();
            },
            child: Text(
              'Cotinue',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )));
  }
}
