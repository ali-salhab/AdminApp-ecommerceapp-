import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/home_data.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/view/widget/home/listcategories.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';

abstract class HomepageController extends GetxController {
  initiadata();
  getdata();
  gotoitemspage(int selectedcat, List categories, String catid);
}

class HomepageControllerImp extends HomepageController {
  late String name;

  late MyServices services = Get.find();
  Statusrequest statusrequest = Statusrequest.none;
  List categories = [];
  List items = [];
  List<ItemsModel> queryresult = [];
  HomeData homedata = HomeData(Get.find());
  // seaeching part
  late TextEditingController searchcontroller;
  bool issearching = false;
  onsearch() async {
    issearching = true;
    statusrequest = Statusrequest.loading;
    update();
    var response = await homedata.search(searchcontroller.text);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List q = response['data'];
        queryresult.addAll(q.map((e) => ItemsModel.fromJson(e)));
        update();
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
  }

  checksearch(String val) {
    if (val == "") {
      issearching = false;
    }
    update();
  }

  void onInit() {
    FirebaseMessaging.instance.subscribeToTopic("user");
    getdata();
    searchcontroller = TextEditingController();

    name = services.shared.getString('email')!;
    super.onInit();
  }

  String initiadata() {
    return name;
  }

  @override
  getdata() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await homedata.postdata();
    // print("=================response $response");

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        statusrequest = Statusrequest.success;
        update();
      } else {
        Get.defaultDialog(
            title: "Error",
            middleText: "email not registered ... try to login ");
        //here every thing ok but no data where pounded
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  @override
  gotoitemspage(int selectedcat, List categories, String catid) {
    Println("-------------------catid $catid");
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      // slectedcat index in map 0...4
      "selectedcat": selectedcat,
      "catid": catid
    });
    //
  }
}
