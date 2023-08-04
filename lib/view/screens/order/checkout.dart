import 'package:ecommerceapp/controller/adress/viewaddressescontroller.dart';
import 'package:ecommerceapp/controller/order/checkoutcontroller.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:ecommerceapp/view/widget/order/carddeliverymethod.dart';
import 'package:ecommerceapp/view/widget/order/cardpymentmethod.dart';
import 'package:ecommerceapp/view/widget/order/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Checkoutcontroller controler = Get.put(Checkoutcontroller());
    ViewAddressesController addresscontroller =
        Get.put(ViewAddressesController());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.primarycolor,
              borderRadius: BorderRadius.circular(10)),
          child: MaterialButton(
            child: Text(
              "check out",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              controler.checkoutt();
            },
          ),
        ),
        appBar: AppBar(
          title: Text("check out "),
        ),
        body: GetBuilder<Checkoutcontroller>(
          builder: (controller) => Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // color: Colors.red,
            // width: Get.width,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("payment method",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Playfair',
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    CardPaymentmethod(
                      ontap: () {
                        controler.selectpaymentmethod("1");
                      },
                      text: "Cash",
                      isactive: controler.paymentmethod == "1" ? true : false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CardPaymentmethod(
                      ontap: () {
                        controler.selectpaymentmethod("0");
                      },
                      text: "Cart",
                      isactive: controler.paymentmethod == "0" ? true : false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("delivery method",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Playfair',
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CardDeliveryMethod(
                      ontap: () {
                        print("tabed delivery");
                        controler.selectdeliverymethod("1");
                      },
                      image: ImageAssets.delivery,
                      isactive: controler.deliverymethod == "1" ? true : false,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CardDeliveryMethod(
                      ontap: () {
                        print("tabed recieve");
                        controler.selectdeliverymethod("0");
                      },
                      image: ImageAssets.recive,
                      isactive: controler.deliverymethod == "0" ? true : false,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                controller.deliverymethod == "1"
                    ? Column(
                        children: [
                          const Text(
                            "shiping address",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Playfair',
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              ...List.generate(
                                addresscontroller.addresses.length,
                                (index) => CardShippingMethod(
                                  city: addresscontroller
                                      .addresses[index].addressCity!,
                                  ontap: () {
                                    controler.selectshippingaddress(
                                        addresscontroller
                                            .addresses[index].addressId!);
                                  },
                                  address: addresscontroller
                                      .addresses[index].addressName!,
                                  addressdetails: addresscontroller
                                      .addresses[index].addressStreet!,
                                  isactive: controler.shippingaddress ==
                                          addresscontroller
                                              .addresses[index].addressName
                                      ? true
                                      : false,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    : Text('')
              ],
            ),
          ),
        ));
  }
}
