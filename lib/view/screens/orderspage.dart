import 'package:adminapp/controller/orderpagecontroler.dart';
import 'package:adminapp/view/screens/pendingorders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrderPageController controller = Get.put(OrderPageController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<OrderPageController>(
        builder: (controler) => BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: (val) {
              controller.onItemTapped(val);
              if (val == 0) {
                controller.getpendingorders();
              } else {
                controller.getacceptedorders();
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.pending), label: "pending orders"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive), label: "accepted orders")
            ]),
      ),
      appBar: AppBar(
        title: Text("Orders Page"),
      ),
      body: GetBuilder<OrderPageController>(
          builder: (controller) => controller.pages[controller.selectedIndex]),
    );
  }
}
