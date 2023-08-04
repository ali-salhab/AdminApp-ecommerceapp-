import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/route.dart';
import '../data/datasource/static/static.dart';

abstract class OnboardingController extends GetxController {
  next();
  onpagechanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  int currentpage = 0;
  late PageController pagecontroller;
  @override
  next() {
    currentpage++;
    if (currentpage > onboardinglist.length - 1) {
      Get.offAllNamed(AppRoutes.login);
    }
    pagecontroller.animateToPage(currentpage,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  onpagechanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
