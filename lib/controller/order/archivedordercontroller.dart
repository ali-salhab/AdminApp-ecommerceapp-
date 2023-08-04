import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/functions/showRatingdialog.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/order/archivedordersdata.dart';
import 'package:ecommerceapp/data/datasource/remote/order/checkoutdata.dart';
import 'package:ecommerceapp/data/datasource/remote/order/pendingorderdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ArchivedOrderController extends GetxController {
  ArchivedOrdersData archievedorders = ArchivedOrdersData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;
  MyServices ser = Get.find();

  List data = [];
  gotoorderdetails(Map dataa) {
    Get.toNamed(AppRoutes.OderDetails, arguments: {"data": dataa});
  }

  printorderstatus(val) {
    if (val == "0") {
      return "Await approval";
    } else if (val == "1") {
      return "prepare";
    } else if (val == "2") {
      return "on the way";
    } else {
      return "archived";
    }
  }

  printdeliverymethod(val) {
    if (val == "1") {
      return "Cash";
    }
    if (val == "0") {
      return "card";
    }
  }

  printordertype(val) {
    if (val == "1") {
      return "delivery";
    }
    if (val == "0") {
      return "recive";
    }
  }

  getarchievedorders() async {
    statusrequest = Statusrequest.loading;
    update();

    var response =
        await archievedorders.getarchivedorders(ser.shared.getString('id')!);
    print("sssssssss$response");
    print(response);
    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        // List contain maps
        data = response['data'];
      } else {}
    }
    update();
  }

  rateorder(String orderid, String val, String text) async {
    statusrequest = Statusrequest.loading;
    update();

    var response = await archievedorders.rateorder(
        ser.shared.getString('id')!, orderid, text, val);
    print("sssssssss$response");
    print(response);
    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
      } else {}
    }
    update();
  }

  @override
  void onInit() {
    getarchievedorders();
    super.onInit();
  }

  ontaprating(String orderid) {
    ShowRatingDialog(Get.context!, orderid);
  }
}
