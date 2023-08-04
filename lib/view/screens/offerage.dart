import 'package:ecommerceapp/controller/offercontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/view/widget/home/customappbar.dart';
import 'package:ecommerceapp/view/widget/items/customitemcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/offer/customoffercart.dart';

class Offerpage extends StatelessWidget {
  const Offerpage({super.key});

  @override
  Widget build(BuildContext context) {
    OfferControllerImp controller = Get.put(OfferControllerImp());
    TextEditingController controllert = TextEditingController();
    return Container(
      width: Get.width,
      height: Get.height,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(5),
            child: CustomAppBar(
              onpressfavorite: () {},
              onChanged: (String) {},
              controller: controllert,
            ),
          ),
          // Expanded(
          //     flex: 3,
          //     child: ListView.builder(
          //         itemCount: controller.offer.length,
          //         itemBuilder: (context, index) {
          //           return CustomOfferCart(
          //             offer: controller.offer[index],
          //           );
          //         }))
          Expanded(
            flex: 1,
            child: GetBuilder<OfferControllerImp>(builder: (controller) {
              return Handlingdataview(
                  statusrequest: controller.statusrequest,
                  widget: ListView.builder(
                      itemCount: controller.offer.length,
                      itemBuilder: (context, index) {
                        return CustomOfferCart(
                          offer: controller.offer[index],
                        );
                      }));
            }),
          ),
        ],
      ),
    );
  }
}
