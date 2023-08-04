import 'package:ecommerceapp/controller/favoriteviewcontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:ecommerceapp/view/widget/home/customappbar.dart';
import 'package:ecommerceapp/view/widget/home/listitems.dart';
import 'package:ecommerceapp/view/widget/items/customitemcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends GetView<FavoriteViewController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteViewController controller = Get.put(FavoriteViewController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ListView(
            children: [
              // CustomAppBar(onpressfavorite: null),
              const SizedBox(
                height: 12,
              ),
              GetBuilder<FavoriteViewController>(builder: (controller) {
                return Handlingdataview(
                    statusrequest: controller.statusrequest,
                    widget: GridView.builder(
                        itemCount: controller.items.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.9, crossAxisCount: 2),
                        itemBuilder: (con, index) {
                          return InkWell(
                            onTap: () {
                              // controller.gotoproductdetails(itemsModel);
                            },
                            child: Card(
                              // color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      '${Applink.items}/${controller.items[index].itemImage!}',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Rating : ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[800]),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        ...List.generate(5, (index) {
                                          return const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 17,
                                          );
                                        })
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "${controller.items[index].itemPrice}"),
                                          IconButton(
                                              onPressed: () {
                                                print(
                                                    "666666666666666666666666");
                                                print(
                                                    "${controller.items[index].favoriteId}");
                                                controller.removefavorite(
                                                    controller.items[index]
                                                        .favoriteId);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                size: 30,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
