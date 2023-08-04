import 'dart:developer';

import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/addressdata.dart';
import 'package:ecommerceapp/data/model/addressmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ViewAddressesController extends GetxController {
  late TextEditingController city;
  late TextEditingController street;
  Statusrequest statusrequest = Statusrequest.none;
  late TextEditingController? name;
  AddressData addressData = AddressData(Get.find());
  late MyServices ser = Get.find();
  List<AddressModel> addresses = [];

  viewaddress() async {
    statusrequest = Statusrequest.loading;
    String userid = await ser.shared.getString("id").toString();
    update();
    var response = await addressData.viewaddress(userid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List d = response['data'];
        addresses.addAll(d.map((e) => AddressModel.fromJson(e)));
      } else {
        Get.defaultDialog(title: "no address", middleText: "add your address");
        statusrequest = Statusrequest.failure;

        //here every thing ok but no data where pounded
        // statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  deleteaddress(String addressid) async {
    statusrequest = Statusrequest.loading;

    update();
    var response = await addressData.deleteaddress(addressid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        addresses.removeWhere((element) => element.addressId == addressid);
      } else {}
    }

    update();
  }

  initviewaddreses() async {
    await viewaddress();
  }

  @override
  void onInit() {
    initviewaddreses();
    // TODO: implement onInit
    super.onInit();
  }
}
