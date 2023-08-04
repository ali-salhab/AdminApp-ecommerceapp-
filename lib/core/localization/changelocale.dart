import 'package:ecommerceapp/core/functions/fcmconfig.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constants/apptheme.dart';

class Localcontroller extends GetxController {
  Locale? languageofdevice;
  ThemeData appthem = appthemEN;
  MyServices myservices = Get.find();
  changelocale(String langcode) {
    Locale locale = Locale(langcode);
    myservices.shared.setString('lang', langcode);
    langcode == 'en' ? appthem = appthemEN : appthem = appthemAR;
    Get.updateLocale(locale);
    Get.changeTheme(appthem);
  }

  requestpermition() async {
    print("peeeeeeermetion");
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.defaultDialog(
          title: "warning", content: Text("make sure to enable location"));
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      print("");
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.defaultDialog(
            title: "warning",
            content: Text("make sure to enable location denied"));
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.defaultDialog(
          title: "warning",
          content: Text("make sure to enable denied for ever "));
    }
    var a = await Geolocator.getCurrentPosition();
    print(a);
    return a;
  }

  @override
  void onInit() {
    requestnotificationpermition();
    fcmconfig();
    requestpermition();
    String language = myservices.shared.getString('lang').toString();

    if (language == 'ar') {
      appthem = appthemAR;
      languageofdevice = const Locale('ar');
    } else if (language == 'en') {
      appthem = appthemEN;

      languageofdevice = const Locale('en');
    } else {
      languageofdevice = Get.deviceLocale;
    }
    super.onInit();
  }
}
