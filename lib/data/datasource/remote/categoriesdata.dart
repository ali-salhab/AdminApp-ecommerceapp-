import 'dart:io';

import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/linkapi.dart';
import 'package:get/get.dart';

class CategoriesData {
  Crud crud = Get.find();
  CategoriesData(this.crud);
  getdata() async {
    var response = await crud.postdata(Applink.categoriesview, {});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  addcat(String nameen, String namear, File image) async {
    var response = await crud.addRequestWithImageOne(Applink.categoriesadd,
        {"catnameen": nameen, "catnamear": nameen}, image);

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  deletecat(String imagename, String id) async {
    var response = await crud
        .postdata(Applink.categoriesdelete, {"id": id, "imagename": imagename});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  editcat(String nameen, String namear, String oldname, String id,
      {File? file = null}) async {
    var response;
    if (file == null) {
      response = await crud.postdata(Applink.categoriesedit, {
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
