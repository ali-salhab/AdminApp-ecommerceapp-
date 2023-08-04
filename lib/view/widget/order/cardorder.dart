import 'package:ecommerceapp/controller/order/pendingorderscontrollers.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cardorder extends GetView<Pendingorderscontroller> {
  final String ordertype;
  final String carttype;
  final void Function()? ontaprating;
  final String ordernumber;
  final String orderprice;
  final String deliveryprice;
  final String paymentmethod;
  final String totalprice;
  final String orderstatus;
  final String date;
  final String orderid;
  Map data = {};

  Cardorder(
      {super.key,
      required this.carttype,
      required this.orderid,
      required this.ontaprating,
      required this.data,
      required this.ordertype,
      required this.orderprice,
      required this.deliveryprice,
      required this.paymentmethod,
      required this.ordernumber,
      required this.totalprice,
      required this.orderstatus,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order number : ${ordernumber}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cairo"),
                ),
                Text(
                  date,
                  style: TextStyle(
                      color: AppColors.primarycolor, fontFamily: "Cairo"),
                )
              ],
            ),
            Divider(
              thickness: 5,
            ),
            Text("order type : ${ordertype}"),
            Text("order price : ${orderprice}\$"),
            Text("delivery price : ${deliveryprice} \$"),
            Text("payment method : ${paymentmethod}"),
            Text("oder status : ${orderstatus}"),
            Divider(
              thickness: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "totalprice :${totalprice}\$",
                  style: TextStyle(
                      color: AppColors.primarycolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Cairo'),
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        controller.gotoorderdetails(data);
                      },
                      child: Text(
                        "Details",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    carttype == "pending"
                        ? MaterialButton(
                            onPressed: () {
                              controller.deleteorder(orderid);
                            },
                            child: Text(
                              "delete order",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        : InkWell(
                            onTap: ontaprating,
                            child: Text(
                              "Rate Order",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
