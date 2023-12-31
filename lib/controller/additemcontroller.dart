import 'dart:io';

import 'package:adminapp/controller/itemcontroller.dart';
import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/core/constants/route.dart';
import 'package:adminapp/core/functions/handlingdata.dart';
import 'package:adminapp/core/functions/uploadfile.dart';
import 'package:adminapp/data/datasource/remote/categoriesdata.dart';
import 'package:adminapp/data/datasource/remote/itemsdata.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddItemController extends GetxController {}

class AddItemControllerImp extends AddItemController {
  bool checkval = true;

  List<SelectedListItem> categories = [];
  File? file = null;

  TextEditingController? namear;
  TextEditingController? nameen;
  TextEditingController? descar;
  TextEditingController? descen;
  TextEditingController? discount;
  TextEditingController? count;
  TextEditingController? price;

  TextEditingController? catname;
  TextEditingController? catid;

  Statusrequest statusrequest = Statusrequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CategoriesData catdata = CategoriesData(Get.find());
  ItemsData itemdata = ItemsData(Get.find());
  getCategories() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await catdata.getdata();

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List c = response['data'];

        for (int i = 0; i < c.length; i++) {
          categories.add(SelectedListItem(
              name: c[i]['categories_name'], value: c[i]['categories_id']));
        }
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  additem() async {
    print("object");
    print(catid);
    if (catid!.text == "") {
      return Get.defaultDialog(
          title: "Error",
          content: Text("plese select categorie"),
          onConfirm: () {
            Get.back();
          });
    }
    if (file == null) {
      return Get.defaultDialog(
          onCustom: () {
            print("will popdffffdf");
            if (file != null) {
              Get.back();
              update();
            }
          },
          onWillPop: () {
            print("will pop");
            return Future.value(true);
          },
          title: "Error",
          content: Text("plese select image"),
          onConfirm: () {
            print("dfdfdf");
            if (file != null) {
              Get.back();
              update();
            }
            chooseimage();
          });
    }
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      Map data = {
        "itemnameen": nameen!.text,
        "itemnamear": namear!.text,
        "itemdescen": descen!.text,
        "itemdescar": descar!.text,
        "itemcount": count!.text,
        "itemcat": catid!.text,
        "itemactive": checkval == true ? "1" : "0",
        "itemdiscount": discount!.text,
        "itemprice": price!.text
      };
      var response = await itemdata.additem(data, file!);

      statusrequest = handlingdata(response);
      ItemsControllerImp cont = Get.find();

      if (statusrequest == Statusrequest.success) {
        if (response['status'] == 'success') {
          cont.getdata();
          Get.offNamed(AppRoutes.item);
        } else {
          statusrequest = Statusrequest.failure;
          update();
        }
      }
      update();
    }
  }

  chooseimage() async {
    // update();
    Get.bottomSheet(Container(
      padding: EdgeInsets.all(20),
      color: Colors.black38,
      width: Get.width,
      height: Get.height / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "select image",
            style: TextStyle(color: Colors.white),
          ),
          Divider(
            thickness: 5,
            color: Colors.white,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: MaterialButton(
                  height: 50,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: AppColors.primarycolor,
                  onPressed: () async {
                    // controller.chooseimage();
                    file = await imageuploadcamera();
                    Get.back();
                    update();
                  },
                  child: Text(
                    "Camera",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: MaterialButton(
                  height: 50,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: AppColors.primarycolor,
                  onPressed: () async {
                    // controller.chooseimage();
                    file = await fileuploadgalllery(issvg: true);
                    Get.back();
                    update();
                  },
                  child: Text("Gallery",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          )
        ],
      ),
    ));

    update();
  }

  @override
  void onInit() {
    getCategories();
    namear = TextEditingController();
    nameen = TextEditingController();
    descar = TextEditingController();
    descen = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    price = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();

    super.onInit();
  }
}
  // 



