import 'package:adminapp/controller/home_page_controller.dart';
import 'package:adminapp/view/widget/homepagecard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageControllerImp controller = Get.put(HomepageControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("admin Dashboard"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            HomepageCard(
              title: "Categories",
              icon: Icons.category_rounded,
              ontap: () {
                controller.gotocategories();
              },
            ),
            HomepageCard(
              title: "items",
              icon: Icons.production_quantity_limits,
              ontap: () {
                controller.gotoitemspage();
              },
            ),
            HomepageCard(
              title: "orders",
              icon: Icons.online_prediction_rounded,
              ontap: () {
                controller.gotoorderspage();
              },
            )
          ],
        ),
      ),
    );
  }
}
