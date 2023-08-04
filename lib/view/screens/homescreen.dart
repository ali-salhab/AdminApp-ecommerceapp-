import 'package:ecommerceapp/controller/homescreencontroller.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/view/widget/home/customappbatbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      bool val = true;
      return Scaffold(
          backgroundColor: Colors.grey[300],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primarycolor,
            onPressed: () {
              controller.gotocartpage();
            },
            child: Icon(Icons.shopping_basket_outlined),
          ),
          // backgroundColor: Colors.amber,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
                children: List.generate(controller.widget.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              if (i == 2 && val) {
                val = false;
                return Spacer();
              } else {
                return CustomAppBarButton(
                    isactive: controller.currentpage == i ? true : false,
                    onPressed: () {
                      controller.changepage(i);
                    },
                    title: controller.titleappbar[i]['title'],
                    icon: controller.titleappbar[i]['icon']);
              }
            })),
          ),
          body: WillPopScope(
            onWillPop: () {
              Get.defaultDialog();
              return Future.value(true);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 7),
                child: controller.widget[controller.currentpage]),
          ));
    });
  }
}
