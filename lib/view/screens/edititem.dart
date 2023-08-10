import 'package:adminapp/controller/addcategoriecontroller.dart';
import 'package:adminapp/controller/additemcontroller.dart';
import 'package:adminapp/controller/edititemcontroller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/core/constants/imageassets.dart';
import 'package:adminapp/core/functions/validinput.dart';
import 'package:adminapp/core/shared/customfropdownsearch.dart';
import 'package:adminapp/linkapi.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class EditItems extends StatelessWidget {
  const EditItems({super.key});

  @override
  Widget build(BuildContext context) {
    EditItemControllerImp controller = Get.put(EditItemControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Item"),
        ),
        body: GetBuilder<EditItemControllerImp>(
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
                    GetBuilder<EditItemControllerImp>(
                        builder: (controller) => Handlingdataview(
                              statusrequest: controller.statusrequest,
                              widget: CustomDropDownSearch(
                                title: 'choose cat',
                                data: controller.categories,
                                dropdownselectedname: controller.catname!,
                                dropdownselectedid: controller.catid!,
                              ),
                            )),
                    GetBuilder<EditItemControllerImp>(
                        builder: (controller) => Handlingdataview(
                              statusrequest: controller.statusrequest,
                              widget: Row(
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
                            )),
                    GetBuilder<EditItemControllerImp>(
                        builder: (controller) => controller.file == null
                            ? InkWell(
                                onTap: () {
                                  controller.chooseimage();
                                },
                                child: Container(
                                  child: Image.network(Applink.items +
                                      "/${controller.thisdata['item_image']}"),
                                  width: 100,
                                  height: 100,
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
                              )),
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
                          controller.updateitem();
                          // await controller.addcat();
                        },
                        child: Text("Update"),
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
