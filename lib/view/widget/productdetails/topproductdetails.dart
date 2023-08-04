import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/productdetailscontroller.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: Get.width,
          height: 200,
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 20, spreadRadius: 20)
              ],
              color: Colors.white,
              gradient: LinearGradient(colors: [
                Color.fromARGB(200, 245, 122, 40),
                Color.fromARGB(64, 221, 126, 18)
              ], stops: [
                0.1,
                0.8
              ]),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        Positioned(
          top: 10,
          left: Get.width / 8,
          right: Get.width / 8,
          child: Container(
              width: 250,
              height: 250,
              child: Hero(
                tag: controller.itemmodel.itemId!,
                child: CachedNetworkImage(
                  imageUrl:
                      "${Applink.items}/${controller.itemmodel.itemImage}",
                ),
              )),
        )
      ],
    );
  }
}
