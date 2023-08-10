import 'package:adminapp/core/constants/route.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/model/itemsmodel.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';

abstract class HomepageController extends GetxController {}

class HomepageControllerImp extends HomepageController {
  gotocategories() {
    Get.toNamed(AppRoutes.categories);
  }

  gotoorderspage() {
    Get.toNamed(AppRoutes.orderpage);
  }

  gotoitemspage() {
    Get.toNamed(AppRoutes.item);
  }
}
  // 



