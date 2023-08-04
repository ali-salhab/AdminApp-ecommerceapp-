import 'dart:ffi';

import 'package:ecommerceapp/controller/notificationscontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/view/widget/home/customappbar.dart';
import 'package:ecommerceapp/view/widget/notifications/notificationscard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Notificationscontroller controller = Get.put(Notificationscontroller());
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      color: Colors.grey[300],
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primarycolor),
              width: Get.width,
              child: Center(
                  child: Text(
                "Notificatios",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          Flexible(
              flex: 9,
              child:
                  GetBuilder<Notificationscontroller>(builder: (controoller) {
                return Handlingdataview(
                    statusrequest: controller.statusrequest,
                    widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, i) {
                          return NotificationCard(
                              title: controller.data[i].notificationTitle!,
                              body: controller.data[i].notificationBody!,
                              date: controller.data[i].notificationDatetime!);
                        }));
              })),
        ],
      ),
    );
  }
}
