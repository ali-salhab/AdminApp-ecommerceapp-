import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final Function(String)? onChanged;
  final void Function()? onpressfavorite;
  final void Function()? onpresssearch;
  final TextEditingController controller;
  const CustomAppBar(
      {super.key,
      required this.onpressfavorite,
      required this.onChanged,
      required this.controller,
      this.onpresssearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: Get.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                ),
                width: (Get.width - 10) / 1.4,
                child: TextField(
                  onChanged: onChanged,
                  controller: controller,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Find products",
                      fillColor: AppColors.grey,
                      prefixIcon: InkWell(
                        child: Icon(Icons.search),
                        onTap: onpresssearch,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(17))),
                )),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.grey, borderRadius: BorderRadius.circular(17)),
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.only(left: 10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  size: 35,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.grey, borderRadius: BorderRadius.circular(17)),
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.only(left: 10),
            child: IconButton(
                onPressed: onpressfavorite,
                icon: const Icon(
                  Icons.favorite,
                  size: 35,
                )),
          )
        ],
      ),
    );
  }
}
