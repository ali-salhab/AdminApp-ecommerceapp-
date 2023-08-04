import 'package:ecommerceapp/controller/favoritecontroller.dart';
import 'package:ecommerceapp/controller/items/items_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomiteCard extends StatelessWidget {
  // final ItemsModel itemsModel;
  const CustomiteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerfav = Get.put(FavoriteController());
    return GetBuilder<ItemsControllerImp>(builder: (controller) {
      return Handlingdataview(
          statusrequest: controller.statusrequest,
          widget: GridView.builder(
              itemCount: controller.items.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemBuilder: (context, i) {
                ItemsModel itemsModel =
                    ItemsModel.fromJson(controller.items[i]);

                controllerfav.setfavorite(
                    itemsModel.itemId!, itemsModel.favorite!);
                return InkWell(
                  onTap: () {
                    controller.gotoproductdetails(itemsModel);
                  },
                  child: Stack(
                    children: [
                      Card(
                        // color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    '${Applink.items}/${itemsModel.itemImage!}',
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                translatedatabase(
                                    itemsModel.itemNameAr, itemsModel.itemName),
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rating : ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[800]),
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
                                      // itemsModel.priceafterdiscount!
                                      itemsModel.itemDiscount != "0"
                                          ? "${double.parse(itemsModel.priceafterdiscount!).roundToDouble()} \$"
                                          : itemsModel.itemPrice! + " \$",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                    ),
                                    GetBuilder<FavoriteController>(
                                        builder: (controller) {
                                      return IconButton(
                                          onPressed: () {
                                            if (controller.isfavorite[
                                                    itemsModel.itemId] ==
                                                "0") {
                                              controller.addfavorite(
                                                  controller.services.shared
                                                      .getString('id')!,
                                                  itemsModel.itemId!);
                                              controller.setfavorite(
                                                  itemsModel.itemId!, "1");
                                            } else {
                                              controllerfav.removefavorite(
                                                  controller.services.shared
                                                      .getString('id')!,
                                                  itemsModel.itemId!);
                                              controller.setfavorite(
                                                  itemsModel.itemId!, "0");
                                            }
                                          },
                                          icon: Icon(
                                            controllerfav.isfavorite[
                                                        itemsModel.itemId] ==
                                                    "1"
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined,
                                            size: 30,
                                            color: Colors.red,
                                          ));
                                    })
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemsModel.itemDiscount != "0"
                          ? Container(
                              child: Image.asset(
                                ImageAssets.discount,
                                height: 50,
                                width: 50,
                              ),
                            )
                          : Container()
                    ],
                  ),
                );
              }));
    });
  }
}
