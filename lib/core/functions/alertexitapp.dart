import 'dart:io';

import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertexitpp() {
  Get.defaultDialog(title: 'do you want exit app ? ', actions: [
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text('ok')),
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Cancel'))
  ]);
  return Future.value(true);
}
