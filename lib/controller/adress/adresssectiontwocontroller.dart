import 'dart:developer';

import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/addressdata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddAddressSectiontwocontroller extends GetxController {
  late TextEditingController city;
  late TextEditingController street;
  Statusrequest statusrequest = Statusrequest.none;
  late TextEditingController? name;
  AddressData addressData = AddressData(Get.find());
  late MyServices ser = Get.find();
  late String lat;
  late String long;
  addaddress() async {
    statusrequest = Statusrequest.loading;
    String userid = await ser.shared.getString("id").toString();
    update();
    var response = await addressData.addaddress(
        userid, name!.text, city.text, lat, long, street.text);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        print(response['body']);
      } else {
        Get.defaultDialog(
            title: "Error",
            middleText: "email not registered ... try to login ");
        //here every thing ok but no data where pounded
        // statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    city = TextEditingController();
    street = TextEditingController();

    name = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    // TODO: implement onInit
    super.onInit();
  }
}
