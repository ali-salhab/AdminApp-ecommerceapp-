import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardDeliveryMethod extends StatelessWidget {
  final String image;
  final bool isactive;
  final void Function()? ontap;
  const CardDeliveryMethod({
    super.key,
    required this.image,
    required this.isactive,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(5),
        width: 130,
        height: 130,
        decoration: BoxDecoration(
            color: isactive ? AppColors.primarycolor : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1)),
        child: Stack(
          children: [
            SvgPicture.asset(
              image,
              color: isactive ? Colors.white : Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
