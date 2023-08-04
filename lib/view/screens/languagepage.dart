import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/changelocale.dart';
import '../widget/auth/customlanguagebutton.dart';

class LanguagePage extends GetView<Localcontroller> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '1'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomLanhuageButton(
            buttontext: 'ar',
            onPressed: () {
              controller.changelocale('ar');
              Get.toNamed(AppRoutes.onboarding);
            },
          ),
          CustomLanhuageButton(
            buttontext: 'en',
            onPressed: () {
              controller.changelocale('en');
              Get.toNamed(AppRoutes.onboarding);
            },
          )
        ],
      )),
    );
  }
}
