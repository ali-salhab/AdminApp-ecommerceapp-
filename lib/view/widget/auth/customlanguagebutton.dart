import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';

class CustomLanhuageButton extends StatelessWidget {
  final String buttontext;
  final void Function()? onPressed;

  const CustomLanhuageButton(
      {super.key, required this.buttontext, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.primarycolor,
      onPressed: onPressed,
      child: Text(buttontext,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: Colors.white)),
    );
  }
}
