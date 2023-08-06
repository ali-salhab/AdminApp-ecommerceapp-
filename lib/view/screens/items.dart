import 'package:adminapp/controller/categoriescontroller.dart';
import 'package:adminapp/controller/itemcontroller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.grey.shade300,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.gotoaddnewitem();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("items"),
        ),
        body: GetBuilder<ItemsControllerImp>(
          builder: (controller) {
            return Handlingdataview(
                statusrequest: controller.statusrequest,
                widget: Container(
                  margin: const EdgeInsets.all(15),
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColors.primarycolor,
                                  Colors.black,
                                ],
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: AppColors.black,
                                    offset: Offset(0, 0),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    blurStyle: BlurStyle.outer)
                              ],
                              color: const Color.fromARGB(255, 14, 149, 223)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                              border: const Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black))),
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: CachedNetworkImage(
                                  imageUrl: Applink.items +
                                      "/${controller.data[index]['item_image']}",
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(
                                    color: AppColors.primarycolor,
                                  ),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 100,
                                child:
                                    Text(controller.data[index]['item_name']),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  controller
                                      .gotoeditcat(controller.data[index]);
                                },
                                child: Container(
                                    child: const Icon(
                                  Icons.edit_outlined,
                                  size: 30,
                                  color: Colors.white,
                                )),
                              ),
                              InkWell(
                                child: Container(
                                    child: const Icon(
                                  Icons.delete_outline,
                                  size: 30,
                                  color: Colors.white,
                                )),
                                onTap: () {
                                  controller.deletecat(
                                      controller.data[index]['item_image'],
                                      controller.data[index]["item_id"]);
                                },
                              )
                            ],
                          ),
                        );
                      }),
                ));
          },
        ));
  }
}
