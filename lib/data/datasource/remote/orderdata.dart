import 'dart:io';

import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/linkapi.dart';
import 'package:get/get.dart';

class OrderData {
  Crud crud = Get.find();
  OrderData(this.crud);
  getpendingorders() async {
    var response = await crud.postdata(Applink.viewpending, {});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  getacceptedorders() async {
    var response = await crud.postdata(Applink.viewaccepted, {});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  getarchivedorders() async {
    var response = await crud.postdata(Applink.viewarchive, {});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  approveorder(
    String orderid,
    String userid,
  ) async {
    var response = await crud
        .postdata(Applink.approveorder, {"userid": userid, "orderid": orderid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  doneprepare(String orderid, String userid, String ordertype) async {
    var response = await crud.postdata(Applink.prepareorder,
        {"userid": userid, "orderid": orderid, "type": ordertype});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
