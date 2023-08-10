import 'package:adminapp/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:z_time_ago/z_time_ago.dart';

class Cardorder extends StatelessWidget {
  final String ordertype;

  final String carttype;
  final void Function()? ontaprating;
  final void Function()? ontapaccept;
  final String ordernumber;
  final String orderprice;
  final String deliveryprice;
  final String paymentmethod;
  final String totalprice;
  final String buttontext;
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
      required this.date,
      this.ontapaccept,
      required this.buttontext});

  @override
  Widget build(BuildContext context) {
    String result = ZTimeAgo().getTimeAgo(
      date: date,
      language: Language.english,
    );
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
                  result,
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
                        // controller.gotoorderdetails(data);
                      },
                      child: Text(
                        "Details",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    carttype == "pending"
                        ? MaterialButton(
                            onPressed: () {
                              // controller.deleteorder(orderid);
                            },
                            child: Text(
                              "delete order",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        : InkWell(
                            onTap: ontapaccept,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.primarycolor,
                                  borderRadius: BorderRadius.circular(15)),
                              width: 100,
                              height: 50,
                              child: Center(
                                  child: Text(
                                buttontext,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'poppins',
                                    fontSize: 18),
                              )),
                            ))
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
