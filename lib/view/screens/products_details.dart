import 'package:ecommerceapp/controller/cartcontroller.dart';
import 'package:ecommerceapp/controller/productdetailscontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/view/widget/productdetails/productcountprice.dart';
import 'package:ecommerceapp/view/widget/productdetails/subitems.dart';
import 'package:ecommerceapp/view/widget/productdetails/topproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            color: AppColors.primarycolor,
            borderRadius: BorderRadius.circular(10)),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () async {
            controller.cartcontroller.refreshcartpage();
            controller.gotocartpage();
          },
          child: Text(
            "Go to cart",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: ListView(
        children: [
          const TopProductDetails(),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${controller.itemmodel.itemName}",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<ProductDetailsControllerImp>(builder: (controllere) {
            return Handlingdataview(
                statusrequest: controller.statusrequest,
                widget: ProductCountPrice(
                  price: controller.itemmodel.itemPrice!,
                  number: controller.count.toString(),
                  onPressedplus: () {
                    controller.onpressplus();
                  },
                  onPressedminus: () {
                    controller.onpressminus();
                    // controllercart.removefromcart(controller.itemmodel.itemId!);
                  },
                ));
          }),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${controller.itemmodel.itemDesc}",
              // style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Color",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.left,
            ),
          ),
          SubItems()
        ],
      ),
    );
  }
}
