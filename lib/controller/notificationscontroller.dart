import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/home_data.dart';
import 'package:ecommerceapp/data/datasource/remote/notifications.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/data/model/notificationmodel.dart';
import 'package:ecommerceapp/view/widget/home/listcategories.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';

class Notificationscontroller extends GetxController {
  late String name;

  late MyServices services = Get.find();
  Statusrequest statusrequest = Statusrequest.none;
  List<NotificationModel> data = [];

  NotificationsData notidata = NotificationsData(Get.find());

  getnoti() async {
    statusrequest = Statusrequest.loading;
    update();
    var response =
        await notidata.getnotifications(services.shared.getString("id")!);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List q = response['data'];
        data.addAll(q.map((e) => NotificationModel.fromJson(e)));

        update();
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
  }

  void onInit() {
    getnoti();
    super.onInit();
  }
}
