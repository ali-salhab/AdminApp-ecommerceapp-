import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final String date;
  const NotificationCard(
      {super.key, required this.title, required this.body, required this.date});

  @override
  Widget build(BuildContext context) {
    print(date);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: Get.width,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          // Text(Jiffy.now().format(pattern: 'yyyy-mm-dd hh:mm:ss').toString()),
          Positioned(
            right: 10,
            top: 10,
//             final jiffy = Jiffy.parse(
//   '1997-09-23 13:37:00',
//   pattern: 'yyyy-MM-dd HH:mm:ss'
// );
            child: Text(
              Jiffy.parse(date, pattern: 'yyyy-MM-dd HH:mm:ss').fromNow()
              // Jiffy.now().format(pattern: 'yyyy-MM-dd h:mm:ss'),
              ,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              width: 150,
              child: Text(
                  // maxLines: 2,
                  style: TextStyle(
                    color: AppColors.primarycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                  title),
            ),
          ),
          Positioned(
            child: Container(width: 200, child: Text(body)),
            left: 10,
            bottom: 16,
          ),
        ],
      ),
    );
  }
}
