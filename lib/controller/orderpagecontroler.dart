import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/functions/handlingdata.dart';
import 'package:adminapp/data/datasource/remote/orderdata.dart';
import 'package:adminapp/view/screens/acceptedorders.dart';
import 'package:adminapp/view/screens/pendingorders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPageController extends GetxController {
  int selectedIndex = 0;
  List<Widget> pages = [
    PendingOrder(),
    AcceptedOrder(),
  ];
  void onItemTapped(int index) {
    selectedIndex = index;
    print(index);
    update();
  }

  List pendingdata = [];
  List accepteddata = [];
  Statusrequest statusrequest = Statusrequest.none;
  OrderData orderdata = OrderData(Get.find());
  getpendingorders() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await orderdata.getpendingorders();

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        pendingdata = response['data'];
        print(pendingdata);
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  getacceptedorders() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await orderdata.getacceptedorders();

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        accepteddata = response['data'];
        print(accepteddata);
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  approveorder(String orderid, String userid) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await orderdata.approveorder(orderid, userid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  doneprepare(String orderid, String userid, String ordertype) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await orderdata.doneprepare(orderid, userid, ordertype);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  @override
  void onInit() {
    getpendingorders();
    getacceptedorders();
    // TODO: implement onInit
    super.onInit();
  }
}
