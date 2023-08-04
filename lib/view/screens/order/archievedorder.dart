import 'package:ecommerceapp/controller/order/archivedordercontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/view/widget/order/cardorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Archievedorder extends StatelessWidget {
  const Archievedorder({super.key});

  @override
  Widget build(BuildContext context) {
    ArchivedOrderController controller = Get.put(ArchivedOrderController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Archieved orders"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<ArchivedOrderController>(
            builder: (controller) {
              return Handlingdataview(
                  statusrequest: controller.statusrequest,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        // return Text("asasas");
                        return Cardorder(
                          ontaprating: () {
                            controller.ontaprating(
                                controller.data[index]['order_id']!);
                          },
                          carttype: "archieved",
                          orderid: controller.data[index]['order_id'],
                          data: {},
                          ordertype: controller.printordertype(
                              controller.data[index]['order_type']),
                          orderprice: controller.data[index]['order_price'],
                          deliveryprice: controller.data[index]
                              ['order_shippingprice'],
                          paymentmethod: controller.printdeliverymethod(
                              controller.data[index]['order_paymentmethod']),
                          ordernumber: controller.data[index]['order_id'],
                          totalprice: controller.data[index]['order_totalprice']
                              .toString(),
                          orderstatus: controller.printorderstatus(
                              controller.data[index]['order_status']),
                          date: '',
                        );
                      }));
            },
          ),
        ));
  }
}
