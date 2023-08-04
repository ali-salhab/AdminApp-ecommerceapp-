import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/home_data.dart';
import 'package:ecommerceapp/data/datasource/remote/offerdata.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/view/widget/home/listcategories.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';

abstract class OfferController extends GetxController {
  getdata();
}

class OfferControllerImp extends OfferController {
  Statusrequest statusrequest = Statusrequest.none;

  OfferData offerdata = OfferData(Get.find());
  List<ItemsModel> offer = [];
  gotoproductdetails(ItemsModel itemmodel) {
    Get.toNamed(AppRoutes.productdetails,
        arguments: {"productdetails": itemmodel});
  }

  @override
  getdata() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await offerdata.getdata();
    // print("=================response $response");

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List off = response['data'];
        offer.addAll(off.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    // TODO: implem
    //ent onInit
    super.onInit();
  }
}
