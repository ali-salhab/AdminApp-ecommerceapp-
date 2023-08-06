import 'package:adminapp/controller/addcategoriecontroller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({super.key});

  @override
  Widget build(BuildContext context) {
    AddCategorieControllerImp controller = Get.put(AddCategorieControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Categorie"),
        ),
        body: GetBuilder<AddCategorieControllerImp>(
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
                            label: Text("  CatnameAr   "),
                            hintText: "Categorie name arabic",
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
                            label: Text("  CatnameEn   "),
                            hintText: "Categorie name english",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AddCategorieControllerImp>(
                      builder: (controller) => controller.file == null
                          ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 150),
                              child: MaterialButton(
                                height: 50,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: AppColors.primarycolor,
                                onPressed: () {
                                  controller.chooseimage();
                                },
                                child: Icon(Icons.camera_alt_outlined),
                              ),
                            )
                          : Container(
                              width: 100,
                              height: 100,
                              child: SvgPicture.file(
                                controller.file!,
                                width: 100,
                                height: 100,
                                // color: Colors.black,
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
                          await controller.addcat();
                        },
                        child: Text("Add Categorie"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
