import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CardShippingMethod extends StatelessWidget {
  final String address;
  final String addressdetails;
  final String city;
  final bool isactive;
  final void Function()? ontap;

  const CardShippingMethod({
    super.key,
    required this.address,
    required this.addressdetails,
    required this.isactive,
    required this.ontap,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 5),
        padding: EdgeInsets.all(5),
        width: 310,
        height: 60,
        decoration: BoxDecoration(
            color: isactive ? AppColors.primarycolor : null,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  address,
                  style:
                      TextStyle(color: isactive ? Colors.white : Colors.black),
                ),
                Text(
                  city,
                  style:
                      TextStyle(color: isactive ? Colors.white : Colors.black),
                ),
              ],
            ),
            Text(
              addressdetails,
              style: TextStyle(color: isactive ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
