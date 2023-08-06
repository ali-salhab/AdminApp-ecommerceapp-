import 'package:adminapp/controller/categoriescontroller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp controller = Get.put(CategoriesControllerImp());
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.grey.shade300,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.gotoaddnewcategorie();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        body: GetBuilder<CategoriesControllerImp>(
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
                                child: SvgPicture.network(Applink.categories +
                                    "/${controller.data[index]['categories_image']}"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 100,
                                child: Text(
                                    controller.data[index]['categories_name']),
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
                                      controller.data[index]
                                          ['categories_image'],
                                      controller.data[index]["categories_id"]);
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
