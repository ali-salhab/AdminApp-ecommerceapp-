import 'package:ecommerceapp/controller/order/orderdetailscontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/view/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class OderDetails extends StatelessWidget {
  const OderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double totalprice = 0;

    Orderdetailscontroller controller = Get.put(Orderdetailscontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("order details"),
      ),
      body: Container(
          // child: ListView.builder(
          //     itemCount: controller.data.length,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         child: Text(controller.data.toString()),
          //       );
          //     }),
          child: GetBuilder<Orderdetailscontroller>(
        builder: (controller) {
          return Handlingdataview(
            statusrequest: controller.statusrequest,
            widget: ListView(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  // width: Get.width,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Table(
                        border: TableBorder.all(color: Colors.black),
                        columnWidths: const {
                          0: FlexColumnWidth(4),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(2),
                        },
                        children: [
                          const TableRow(children: [
                            Text(
                              "item",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.primarycolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              "QTY",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.primarycolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              "price",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.primarycolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ]),
                          ...List.generate(controller.orderdetail.length,
                              (index) {
                            totalprice += int.parse(
                                controller.orderdetail[index].orderTotalprice!);
                            return TableRow(children: [
                              Text(
                                controller.orderdetail[index].itemName
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                controller.orderdetail[index].orderitemcount
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: "cairo",
                                    color: Colors.black,
                                    fontSize: 18),
                              ),
                              Text(
                                controller.orderdetail[index].itemPrice
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: "cairo",
                                    fontSize: 18),
                              ),
                            ]);
                          })
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 200,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: Center(
                      child: Text(
                        "Shipping Price : ${controller.data['order_type'] == '1' ? controller.data['order_shippingprice'] : "0"}  \$ ",
                        style: const TextStyle(
                            fontFamily: "cairo",
                            color: AppColors.primarycolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 200,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: Center(
                      child: Text(
                        "Total Price  :${controller.data['order_totalprice']} \$",
                        style: const TextStyle(
                            fontFamily: "cairo",
                            color: AppColors.primarycolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: Get.width,
                  height: 200,
                  child: YandexMap(
                    mapObjects: controller.mapObjects,
                    mapType: MapType.map,
                    onMapCreated: (YandexMapController c) {
                      double lat =
                          double.parse(controller.orderdetail[0].addressLat!);
                      double long =
                          double.parse(controller.orderdetail[0].addressLong!);

                      print("from yadex map ================$lat $long      >");

                      Point point = Point(longitude: long, latitude: lat);
                      controller.mapcontroller.complete(c);
                      controller.initialcameaposition(c, point);
                    },
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
