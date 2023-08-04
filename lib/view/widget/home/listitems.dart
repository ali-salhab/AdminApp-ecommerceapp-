import 'package:ecommerceapp/controller/home_page_controller.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ItemsList extends GetView<HomepageControllerImp> {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 120,
      // color: AppColors.black,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[index]),
            );
          }),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              // color: Colors.amber,
              ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: 100,
          height: 100,
          child: CachedNetworkImage(
              imageUrl: "${Applink.items}/${itemsModel.itemImage}"),
        ),
        Positioned(
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.3),
                // boxShadow: [
                //   BoxShadow(
                //       blurStyle: BlurStyle.inner,
                //       offset: Offset(0, 80),
                //       color: Colors.black,
                //       blurRadius: 10,
                //       spreadRadius: 0.1),
                // ],
                // gradient: LinearGradient(
                //   begin: Alignment.topRight,
                //   end: Alignment.bottomLeft,
                //   colors: [
                //     Colors.blue,
                //     Colors.red,
                //   ],
                // ),
                // color: Colors.white,
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(10),
                //     topRight: Radius.circular(10),
                //     bottomLeft: Radius.circular(10),
                //     bottomRight: Radius.circular(10)),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.2),
                //     spreadRadius: 7,
                //     blurRadius: 9,
                //     offset: Offset(7, 9), // changes position of shadow
                //   ),

                // border: Border(
                //     bottom: BorderSide(
                //         width: 10, color: Colors.black.withOpacity(0.3))),
              ),
              width: 120,
              height: 120,
              // color: AppColors.black.withOpacity(0.3),
            ))
      ],
    );
  }
}
