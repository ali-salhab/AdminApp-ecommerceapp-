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
  late String name;

  late MyServices services = Get.find();
}
  // Statusrequest statusrequest = Statusrequest.none;
  // List categories = [];
  // List items = [];
  // List<ItemsModel> queryresult = [];

  // late TextEditingController searchcontroller;
  // bool issearching = false;
  

  // getdata() async {
  //   statusrequest = Statusrequest.loading;
  //   update();
  //   var response = await homedata.postdata();
  //   // print("=================response $response");

  //   statusrequest = handlingdata(response);

  //   if (statusrequest == Statusrequest.success) {
  //     if (response['status'] == 'success') {
  //       categories.addAll(response['categories']);
  //       items.addAll(response['items']);
  //       statusrequest = Statusrequest.success;
  //       update();
  //     } else {
  //       Get.defaultDialog(
  //           title: "Error",
  //           middleText: "email not registered ... try to login ");
  //       //here every thing ok but no data where pounded
  //       statusrequest = Statusrequest.failure;
  //       update();
  //     }
  //   }
  //   update();
  // }



