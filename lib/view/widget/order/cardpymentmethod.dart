import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CardPaymentmethod extends StatelessWidget {
  final String text;
  final bool isactive;
  final void Function()? ontap;
  const CardPaymentmethod({
    super.key,
    required this.text,
    required this.isactive,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 250,
        height: 35,
        decoration: BoxDecoration(
            color: isactive ? AppColors.primarycolor : null,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1.4)),
        child: Center(
            child: Text(
          "${text}",
          style: TextStyle(color: isactive ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}
