import 'package:ecommerceapp/controller/cartcontroller.dart';
import 'package:ecommerceapp/controller/productdetailscontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:ecommerceapp/view/widget/cart/customCartItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp controllercart = Get.put(CartControllerImp());
    // ProductDetailsControllerImp pcontroller =
    //     Get.put(ProductDetailsControllerImp());
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Scaffold(
          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)
                    // gradient: LinearGradient(stops: const [
                    //   1,
                    //   10
                    // ], colors: [
                    //   Color.fromARGB(103, 226, 209, 197),
                    //   Color.fromARGB(122, 255, 125, 18).withOpacity(0.7)
                    // ]),
                    ),
                // height: 350,
                // width: 500,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GetBuilder<CartControllerImp>(builder: (controller) {
                      return controller.appliedcoupon
                          ? Text(controller.coupondata[0].couponName!)
                          : Container(
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    // margin: EdgeInsets.all(8),
                                    child: Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 40,
                                          child: TextFormField(
                                            controller: controllercart.coupon,
                                            // cursorHeight: 3,
                                            // cursorWidth: 23,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.code),
                                                label: Text("Coupon code"),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          "add coupon",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: AppColors.primarycolor,
                                        onPressed: () {
                                          controllercart.checkCoupon();
                                        },
                                      ))
                                ],
                              ),
                            );
                    }),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GetBuilder<CartControllerImp>(
                          builder: (controller) {
                            return Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  // color: Colors.red,
                                  border: Border.all(
                                      width: 2, color: AppColors.primarycolor)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "total Count:    ",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Text(
                                        controllercart.totalcount,
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'sans'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("Shipping Price : ",
                                          style:
                                              TextStyle(color: Colors.green)),
                                      // 300\$
                                      // Text(
                                      //   "${controllercart.totalprice}",
                                      //   style: TextStyle(
                                      //       color: Colors.red,
                                      //       fontFamily: 'sans'),
                                      // ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text("total Price :",
                                          style:
                                              TextStyle(color: Colors.green)),
                                      // 300\$
                                      Text(
                                        "${controllercart.totalprice} \$",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'sans'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        )),
                    Container(
                      width: 200,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primarycolor,
                      ),
                      child: InkWell(
                        onTap: () {
                          if (controllercart.cartviewdata.isEmpty) {
                            Get.snackbar("Error", "Cart cant be empty");
                            return;
                          }
                          controllercart.gotocheckoutpage();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                            "Add order",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,

          // ------------------------bottom navigation bar------------------
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  width: Get.width,
                  // height: Get.width / 10,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        stops: [1, 10],
                        colors: [AppColors.primarycolor, Colors.white]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 5),
                          spreadRadius: 2,
                          blurRadius: 5),
                    ],
                    color: AppColors.primarycolor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                          opticalSize: 0.2,
                          weight: 34,
                          fill: 0.5,
                          grade: 0.5,
                        ),
                        SizedBox(
                          width: Get.width / 3,
                        ),
                        const Text(
                          "cart ",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'sans',
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    height: Get.height / 1.45,
                    child: GetBuilder<CartControllerImp>(
                      builder: (controller) {
                        return Handlingdataview(
                          statusrequest: controller.statusrequest,
                          widget: ListView(
                            children: [
                              ...List.generate(
                                  controllercart.cartviewdata.length, (index) {
                                return CustomcartItems(
                                  onpressminus: () async {
                                    await controllercart.removefromcart(
                                        controllercart
                                            .cartviewdata[index].itemId!);
                                    await controllercart.refreshcartpage();
                                  },
                                  onpressplus: () async {
                                    await controllercart.addtocart(
                                        controllercart
                                            .cartviewdata[index].itemId!);
                                    await controllercart.refreshcartpage();
                                  },
                                  itemname: controllercart
                                      .cartviewdata[index].itemName!,
                                  itemprice: controllercart.cartviewdata[index]
                                      .priceofitemafterdiscount!,
                                  itemtotalcount: controllercart
                                      .cartviewdata[index].countofitemincart!,
                                  imageurl:
                                      "${Applink.items}/${controllercart.cartviewdata[index].itemImage!}",
                                );
                              })
                            ],
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
