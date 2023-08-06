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

  addcat(String nameen, String namear, File image) async {
    var response = await crud.addRequestWithImageOne(
        Applink.itemsadd, {"catnameen": nameen, "catnamear": nameen}, image);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  deletecat(String imagename, String id) async {
    var response = await crud
        .postdata(Applink.itemsdelete, {"id": id, "imagename": imagename});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  editcat(String nameen, String namear, String oldname, String id,
      {File? file = null}) async {
    var response;
    if (file == null) {
      response = await crud.postdata(Applink.itemsedit, {
        "catnameen": nameen,
        "catnamear": namear,
        "id": id,
        "oldname": oldname
      });
    } else {
      response = await crud.addRequestWithImageOne(
          Applink.categoriesedit,
          {
            "catnameen": nameen,
            "catnamear": namear,
            "id": id,
            "oldname": oldname
          },
          file);
    }

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
