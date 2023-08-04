import 'package:ecommerceapp/controller/items/items_controller.dart';

import 'package:ecommerceapp/view/widget/home/customappbar.dart';
import 'package:ecommerceapp/view/widget/home/listcategoriesitems.dart';
import 'package:ecommerceapp/view/widget/items/customitemcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: const [
            // CustomAppBar(onpressfavorite: null),
            ListCategoriesItems(),
            CustomiteCard()
          ],
        ),
      ),
    );
  }
}
