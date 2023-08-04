import 'package:ecommerceapp/controller/test_controller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/handlingdataview.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Testcontroller());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarycolor,
          title: Text('testapi'),
          centerTitle: true,
        ),
        body: GetBuilder<Testcontroller>(builder: (controller) {
          return Handlingdataview(
            statusrequest: controller.statusrequest,
            widget: Text("${controller.data}"),
          );
        }));
  }
}
