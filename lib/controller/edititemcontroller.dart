import 'dart:io';

import 'package:adminapp/controller/categoriescontroller.dart';
import 'package:adminapp/controller/itemcontroller.dart';
import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/core/constants/route.dart';
import 'package:adminapp/core/functions/handlingdata.dart';
import 'package:adminapp/core/functions/uploadfile.dart';
import 'package:adminapp/data/datasource/remote/itemsdata.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EditItemController extends GetxController {}

class EditItemControllerImp extends EditItemController {
  bool checkval = true;

  Map thisdata = {};

  List cate = [];
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
  List<SelectedListItem> categories = [];
  Statusrequest statusrequest = Statusrequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CategoriesControllerImp controller = Get.put(CategoriesControllerImp());
  ItemsData itemdata = ItemsData(Get.find());

  updateitem() async {
    if (catid!.text == "") {
      return Get.defaultDialog(
          title: "Error",
          content: Text("plese select categorie"),
          onConfirm: () {
            Get.back();
          });
    }
    // if (file == null) {
    //   return Get.defaultDialog(
    //       onCustom: () {
    //         print("will popdffffdf");
    //         if (file != null) {
    //           Get.back();
    //           update();
    //         }
    //       },
    //       onWillPop: () {
    //         print("will pop");
    //         return Future.value(true);
    //       },
    //       title: "Error",
    //       content: Text("plese select image"),
    //       onConfirm: () {
    //         print("dfdfdf");
    //         if (file != null) {
    //           Get.back();
    //           update();
    //         }
    //         chooseimage();
    //       });
    // }
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      Map data = {
        "id": thisdata['item_id'],
        "itemnameen": nameen!.text,
        "itemnamear": namear!.text,
        "itemdescen": descen!.text,
        "itemdescar": descar!.text,
        "itemcount": count!.text,
        "itemcat": catid!.text,
        "itemactive": checkval == true ? "1" : "0",
        "itemdiscount": discount!.text,
        "itemprice": price!.text,
        "imageoldname": thisdata['item_image']
      };
      var response = await itemdata.edititem(data, file: file);

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
  void onInit() async {
    super.onInit();
    categories = Get.arguments['categories'];

    cate = Get.arguments['cate'];
    print("cate----------------->$cate");
    thisdata = Get.arguments['data'];

    print("---------cate---------------$cate");
    namear = TextEditingController();
    nameen = TextEditingController();
    descar = TextEditingController();
    descen = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    price = TextEditingController();

    catid = TextEditingController();
    catname = TextEditingController();

    catid!.text = thisdata['item_categories'];
    print("init edit ccontrolller ----------------->");
    namear!.text = thisdata['item_name_ar'];
    nameen!.text = thisdata['item_name'];
    descar!.text = thisdata['item_desc_ar'];
    descen!.text = thisdata['item_desc'];
    discount!.text = thisdata['item_discount'];
    count!.text = thisdata['item_count'];
    price!.text = thisdata['item_price'];
    String nammme = "";
    for (int i = 0; i < cate.length; i++) {
      if (cate[i]['id'] == thisdata['item_categories']) {
        nammme = cate[i]['name'];
      }
    }
    catname!.text = nammme;
  }
}
  // 



