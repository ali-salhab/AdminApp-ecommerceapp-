import 'dart:io';

import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/linkapi.dart';
import 'package:get/get.dart';

class ItemsData {
  Crud crud = Get.find();
  ItemsData(this.crud);
  getdata() async {
    var response = await crud.postdata(Applink.itemssview, {});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  additem(Map data, File image) async {
    var response =
        await crud.addRequestWithImageOne(Applink.itemsadd, data, image);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  deleteitem(String id, String imagename) async {
    var response = await crud
        .postdata(Applink.itemsdelete, {"id": id, "imagename": imagename});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  edititem(Map data, {File? file = null}) async {
    var response;
    if (file == null) {
      response = await crud.postdata(Applink.itemsedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(Applink.categoriesedit, data, file);
    }

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
