import 'package:ecommerceapp/controller/onboardingcontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/onboarding/onboardingcustombutton.dart';
import '../widget/onboarding/onboardingdots.dart';
import '../widget/onboarding/sonboardingcustomslider.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: const Column(
            children: [
              Expanded(
                flex: 3,
                child: CustomOnboardingSlider(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [Customdotonboarding(), CustomButtonOnboarding()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
