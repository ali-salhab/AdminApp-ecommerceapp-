import 'package:ecommerceapp/controller/adress/viewaddressescontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressesController controller = Get.put(ViewAddressesController());
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.AddressAdd);
          },
          child: const Text("+"),
        ),
        appBar: AppBar(
          title: Text("Addresses"),
        ),
        body: GetBuilder<ViewAddressesController>(
          builder: (controller) {
            return Handlingdataview(
                statusrequest: controller.statusrequest,
                widget: Container(
                    // margin: EdgeInsets.all(7),
                    child: ListView.builder(
                        itemCount: controller.addresses.length,
                        itemBuilder: (context, index) {
                          return Container(
                            // decoration: BoxDecoration(color: Colors.red),
                            child: Column(
                              children: [
                                Card(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  elevation: 5,
                                  shadowColor: AppColors.primarycolor,
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: AppColors.primarycolor,
                                            ),
                                            Text(
                                              "${controller.addresses[index].addressName}",
                                              style: TextStyle(
                                                  color:
                                                      AppColors.primarycolor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ListTile(
                                        shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        title: Text(
                                            "City : ${controller.addresses[index].addressCity}"),
                                        subtitle: Text(
                                            "Street : ${controller.addresses[index].addressStreet}"),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                          ),
                                          onPressed: () {
                                            controller.deleteaddress(controller
                                                .addresses[index].addressId!);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        })));
          },
        ));
  }
}


//  Card(
//                               surfaceTintColor: Colors.black,
                              // shape: BeveledRectangleBorder(
                              //   borderRadius: BorderRadius.circular(6.0),
                              // ),
//                               shadowColor: AppColors.primarycolor,
//                               elevation: 10,
//                               margin: EdgeInsets.all(10),
//                               child: Container(
//                                 height: 30,
//                                 width: 40,
//                                 color: Colors.red,
//                                 child: Row(
//                                   children: [
//                                     Text("sddsds"),
//                                     ListTile(
//                                       title: Text("city"),
//                                       subtitle: Text("street"),
//                                       trailing: Icon(Icons.delete),
//                                     ),
//                                   ],
//                                 ),
//                               ))