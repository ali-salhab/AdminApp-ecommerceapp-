// ignore_for_file: must_be_immutable

import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final IconData icon;
  bool isactive;
  CustomAppBarButton(
      {super.key,
      this.isactive = false,
      required this.onPressed,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isactive ? AppColors.primarycolor : Colors.grey[800],
          ),
          Text(
            title,
            style: TextStyle(
              color: isactive ? AppColors.primarycolor : Colors.grey[800],
            ),
          )
        ],
      ),
    );
  }
}
