import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/view/screens/homepage.dart';
import 'package:ecommerceapp/view/screens/notifications.dart';
import 'package:ecommerceapp/view/screens/offerage.dart';
import 'package:ecommerceapp/view/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
  gotocartpage();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> widget = [
    const HomePage(),

    Offerpage(),
    // const Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Center(child: Text("favrite"))],
    // ),
    Notifications(),
    SettingPage()
  ];
  List<Map> titleappbar = [
    {"title": "home", "icon": Icons.home_outlined},
    {"title": "Offers", "icon": (Icons.local_offer_outlined)},
    {"title": "Notification", "icon": (Icons.notification_important)},
    {"title": "setting", "icon": (Icons.settings_outlined)},
  ];
  gotocartpage() {
    Get.toNamed(AppRoutes.cart);
  }

  @override
  changepage(int i) {
    currentpage = i;

    update();
  }
}
