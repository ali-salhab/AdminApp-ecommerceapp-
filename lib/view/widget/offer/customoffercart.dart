import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favoritecontroller.dart';
import 'package:ecommerceapp/controller/items/items_controller.dart';
import 'package:ecommerceapp/controller/offercontroller.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOfferCart extends GetView<OfferControllerImp> {
  ItemsModel offer;
  CustomOfferCart({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerfav = Get.put(FavoriteController());
    return InkWell(
      onTap: () {
        controller.gotoproductdetails(offer);
      },
      child: Stack(
        children: [
          Card(
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: '${Applink.items}/${offer.itemImage!}',
                    // imageUrl: '${Applink.items}/${itemsModel.itemImage!}',
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    translatedatabase(offer.itemNameAr, offer.itemName),
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
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // itemsModel.priceafterdiscount!
                          offer.itemDiscount != "0"
                              ? "${double.parse(offer.priceafterdiscount!).roundToDouble()} \$"
                              : offer.itemPrice! + " \$",
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        GetBuilder<FavoriteController>(builder: (controller) {
                          return IconButton(
                              onPressed: () {
                                if (controller.isfavorite[offer.itemId] ==
                                    "0") {
                                  controller.addfavorite(
                                      controller.services.shared
                                          .getString('id')!,
                                      offer.itemId!);
                                  controller.setfavorite(offer.itemId!, "1");
                                } else {
                                  controllerfav.removefavorite(
                                      controller.services.shared
                                          .getString('id')!,
                                      offer.itemId!);
                                  controller.setfavorite(offer.itemId!, "0");
                                }
                              },
                              icon: Icon(
                                controllerfav.isfavorite[offer.itemId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
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
          offer.itemDiscount != "0"
              ? Container(
                  child: Image.asset(
                    ImageAssets.discount,
                    height: 70,
                    width: 70,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
