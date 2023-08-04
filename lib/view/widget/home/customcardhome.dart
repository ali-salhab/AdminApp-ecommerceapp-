import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.primarycolor,
                borderRadius: BorderRadius.circular(15)),
            width: Get.width,
            height: 200,
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(fontSize: 33),
              ),
            ),
          ),
          Positioned(
              right: -70,
              top: -100,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(160)),
              ))
        ],
      ),
    );
  }
}
