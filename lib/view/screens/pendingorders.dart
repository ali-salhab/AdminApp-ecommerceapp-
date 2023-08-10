import 'package:adminapp/controller/orderpagecontroler.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/view/widget/cardorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderPageController>(builder: (controller) {
      return Handlingdataview(
          statusrequest: controller.statusrequest,
          widget: ListView.builder(
              itemCount: controller.pendingdata.length,
              itemBuilder: (context, index) {
                return Cardorder(
                  buttontext: "Accept",
                  carttype: '',
                  orderid: '',
                  ontapaccept: () {
                    controller.approveorder(
                        controller.pendingdata[index]['order_id'],
                        controller.pendingdata[index]['order_userid']);
                  },
                  ontaprating: () {},
                  data: {},
                  ordertype: '.',
                  orderprice: '',
                  deliveryprice: '',
                  paymentmethod: '',
                  ordernumber: '',
                  totalprice: '',
                  orderstatus: '',
                  date: '.',
                );
              }));
    });
  }
}
