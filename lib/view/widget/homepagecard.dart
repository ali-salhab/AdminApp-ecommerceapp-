import 'package:adminapp/core/constants/colors.dart';
import 'package:flutter/material.dart';

class HomepageCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? ontap;
  HomepageCard({
    super.key,
    required this.title,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            boxShadow: [
              const BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  spreadRadius: 5,
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer)
            ],
            color: AppColors.primarycolor,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
