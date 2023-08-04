import 'package:ecommerceapp/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';

class CustomOnboardingSlider extends GetView<OnboardingControllerImp> {
  const CustomOnboardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        onPageChanged: (val) {
          controller.onpagechanged(val);
        },
        controller: controller.pagecontroller,
        itemCount: onboardinglist.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                onboardinglist[i].title.toString(),
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(onboardinglist[i].images.toString()),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  onboardinglist[i].body.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          );
        });
  }
}
