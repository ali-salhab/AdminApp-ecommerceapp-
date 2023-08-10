import 'package:adminapp/controller/addcategoriecontroller.dart';
import 'package:adminapp/controller/additemcontroller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/core/constants/imageassets.dart';
import 'package:adminapp/core/functions/validinput.dart';
import 'package:adminapp/core/shared/customfropdownsearch.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    AddItemControllerImp controller = Get.put(AddItemControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Item"),
        ),
        body: GetBuilder<AddItemControllerImp>(
          builder: (controller) => Handlingdataview(
            statusrequest: controller.statusrequest,
            widget: Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (val) {
                          return validate(val!, 3, 10, "username");
                        },
                        controller: controller.namear,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            label: Text("  itemnamear   "),
                            hintText: "item name arabic",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (val) {
                          return validate(val!, 3, 10, "username");
                        },
                        controller: controller.nameen,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            label: Text("  itemnameen   "),
                            hintText: "item name english",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (val) {
                          return validate(val!, 3, 10, "username");
                        },
                        controller: controller.descen,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            label: Text("ites describtion (English)"),
                            hintText: "item describtion english",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (val) {
                          return validate(val!, 3, 10, "username");
                        },
                        controller: controller.descar,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            label: Text("  itemdiscription (Arabic)   "),
                            hintText: "item describtion arabic",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  return validate(val!, 1, 3, "num");
                                },
                                controller: controller.count,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    label: Text("Count"),
                                    hintText: "item Count",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  return validate(val!, 1, 5, "num");
                                },
                                controller: controller.price,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    label: Text("itemprice"),
                                    hintText: "itemprice",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  return validate(val!, 1, 5, "num");
                                },
                                controller: controller.discount,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    label: Text("itemdiscount"),
                                    hintText: "item discount",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomDropDownSearch(
                      title: 'choose cat',
                      data: controller.categories,
                      dropdownselectedid: controller.catid!,
                      dropdownselectedname: controller.catname!,
                    ),
                    GetBuilder<AddItemControllerImp>(
                      builder: (controller) => Row(
                        children: [
                          Text("Active"),
                          Checkbox(
                              activeColor: AppColors.primarycolor,
                              value: controller.checkval,
                              onChanged: (val) {
                                controller.checkval = val!;
                                print(controller.checkval);
                                controller.update();
                              }),
                        ],
                      ),
                    ),
                    GetBuilder<AddItemControllerImp>(
                      builder: (controller) => controller.file == null
                          ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              margin: EdgeInsets.symmetric(horizontal: 100),
                              child: MaterialButton(
                                height: 50,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: AppColors.primarycolor,
                                onPressed: () {
                                  controller.chooseimage();
                                },
                                child: Icon(Icons.image),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                controller.chooseimage();
                              },
                              child: Container(
                                child: Image.file(controller.file!),
                                width: 100,
                                height: 100,
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: MaterialButton(
                        height: 50,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: AppColors.primarycolor,
                        onPressed: () async {
                          controller.additem();
                          // await controller.addcat();
                        },
                        child: Text("Add item"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
