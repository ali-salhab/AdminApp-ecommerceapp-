import 'package:ecommerceapp/controller/home_page_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/functions/alertexitapp.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/view/screens/cart.dart';
import 'package:ecommerceapp/view/widget/home/customappbar.dart';
import 'package:ecommerceapp/view/widget/home/customcardhome.dart';
import 'package:ecommerceapp/view/widget/home/customtitle.dart';
import 'package:ecommerceapp/view/widget/home/listcategories.dart';
import 'package:ecommerceapp/view/widget/home/listitems.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomepageControllerImp());
    return WillPopScope(
        onWillPop: alertexitpp,
        child: GetBuilder<HomepageControllerImp>(
          builder: (controller) {
            return Handlingdataview(
              statusrequest: controller.statusrequest,
              widget: SafeArea(
                  child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                child: ListView(
                  children: [
                    CustomAppBar(
                      onpresssearch: () async {
                        await controller.onsearch();
                      },
                      onpressfavorite: () {
                        Get.toNamed(AppRoutes.favorite);
                      },
                      controller: controller.searchcontroller,
                      onChanged: (String s) {
                        print(s);

                        controller.checksearch(s);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    controller.issearching
                        ? Container(
                            child: SearchPage(
                              items: controller.queryresult,
                            ),
                          )
                        : Container(
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCardHome(
                                  title: "summer Surprise",
                                  body: "30 % cashback",
                                ),
                                CustomTitle(
                                  title: 'categories',
                                ),
                                ListCategories(),
                                CustomTitle(
                                  title: 'Top Selling',
                                ),
                                ItemsList(),
                              ],
                            ),
                          )
                  ],
                ),
              )),
            );
          },
        ));
  }
}

class SearchPage extends StatelessWidget {
  final List<ItemsModel> items;
  const SearchPage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  child: Column(
                    children: [Text(items[index].itemName!)],
                  ),
                ),
              );
            }));
  }
}
