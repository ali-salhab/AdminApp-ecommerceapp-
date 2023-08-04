import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextSignup extends StatelessWidget {
  final void Function()? ontap;
  final String firsttext;
  final String Secondtext;
  const TextSignup(
      {super.key,
      required this.ontap,
      required this.firsttext,
      required this.Secondtext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firsttext,
          style: TextStyle(color: AppColors.black),
        ),
        InkWell(
          onTap: ontap,
          child: Text(
            Secondtext,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primarycolor),
          ),
        )
      ],
    );
  }
}
