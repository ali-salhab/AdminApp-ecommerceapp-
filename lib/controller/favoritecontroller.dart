import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/favoritedata.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  late String name;
  late MyServices services = Get.find();
  Statusrequest statusrequest = Statusrequest.none;
  List categories = [];
  List items = [];
  FavoriteData favoritedata = FavoriteData(Get.find());
  Map<String, String> isfavorite = {};
  setfavorite(String id, String val) {
    // print("[[[[[[[[[[[[[[[[[[[[[[[[object]]]]]]]]]]]]]]]]]]]]]]]]");
    // print(isfavorite);
    isfavorite[id] = val;

    update();
  }

  addfavorite(String userid, String itemid) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await favoritedata.addfavorite(userid, itemid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "sucess", message: "favrite added");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
  }

  removefavorite(String userid, String itemid) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await favoritedata.removefavorite(userid, itemid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "sucess", message: "favrite removed");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
  }
}
