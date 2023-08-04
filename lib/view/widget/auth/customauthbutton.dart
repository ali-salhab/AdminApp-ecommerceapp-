import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomAuthButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: AppColors.primarycolor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
