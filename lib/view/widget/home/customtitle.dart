import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 25,
          color: AppColors.primarycolor,
          fontWeight: FontWeight.bold),
    );
  }
}
