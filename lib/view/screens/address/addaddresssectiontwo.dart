import 'package:ecommerceapp/controller/adress/adresssectiontwocontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressSectionTwo extends StatelessWidget {
  const AddressSectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressSectiontwocontroller controller =
        Get.put(AddAddressSectiontwocontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("complete address details"),
        ),
        body: GetBuilder<AddAddressSectiontwocontroller>(builder: (controller) {
          return Handlingdataview(
              statusrequest: controller.statusrequest,
              widget: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  CustomTextFormField(
                      label: "address name",
                      valid: (val) {},
                      icon: Icons.pending,
                      mycontroller: controller.name,
                      hint: "enter your address name ",
                      isnumeric: false),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      label: "city",
                      valid: (val) {},
                      icon: Icons.location_city,
                      mycontroller: controller.city,
                      hint: "enter your city",
                      isnumeric: false),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      label: "street",
                      valid: (val) {},
                      icon: Icons.streetview,
                      mycontroller: controller.street,
                      hint: "enter your str,eet",
                      isnumeric: false),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    textColor: Colors.white,
                    color: AppColors.primarycolor,
                    onPressed: () {
                      controller.addaddress();
                      Get.offAllNamed(AppRoutes.homepage);
                    },
                    child: Text("add"),
                  )
                ],
              ));
        }));
  }
}
