import 'package:ecommerceapp/controller/order/pendingorderscontrollers.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Pendingorders extends StatelessWidget {
  const Pendingorders({super.key});

  @override
  Widget build(BuildContext context) {
    Pendingorderscontroller controller = Get.put(Pendingorderscontroller());
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Pending orders"),
        ),
        body: GetBuilder<Pendingorderscontroller>(builder: (controller) {
          return Handlingdataview(
              statusrequest: controller.statusrequest,
              widget: Container(
                  margin: EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Cardorder(
                            orderid: controller.data[i]['order_id'],
                            data: controller.data[i],
                            date: Jiffy.parse(
                                    controller.data[i]["order_datetime"],
                                    pattern: "yyyyy-MM-dd H:mm:ss")
                                .from(Jiffy.parse(
                                    Jiffy.now()
                                        .format(pattern: "yyyyy-MM-dd H:mm:ss"),
                                    pattern:
                                        "yyyyy-MM-dd H:mm:ss")), // 5 years ago,
                            orderstatus: controller.printorderstatus(
                                controller.data[i]['order_status']),
                            totalprice: controller.data[i]['order_totalprice'],
                            ordernumber: controller.data[i]['order_id'],
                            ordertype: controller.printordertype(
                                controller.data[i]['order_type']),
                            orderprice: controller.data[i]['order_price'],
                            deliveryprice: controller.data[i]
                                ['order_shippingprice'],
                            paymentmethod: controller.printdeliverymethod(
                                controller.data[i]['order_paymentmethod']),
                          ),
                        );
                      })));
        }));
  }
}

class Cardorder extends GetView<Pendingorderscontroller> {
  final String ordertype;
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
      required this.orderid,
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
                    MaterialButton(
                      onPressed: () {
                        controller.deleteorder(orderid);
                      },
                      child: Text(
                        "delete order",
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
