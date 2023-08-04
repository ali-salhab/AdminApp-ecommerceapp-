import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/favoritedata.dart';
import 'package:ecommerceapp/data/datasource/remote/favoriteviewdata.dart';
import 'package:ecommerceapp/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

class FavoriteViewController extends GetxController {
  late MyServices services = Get.find();
  Statusrequest statusrequest = Statusrequest.none;

  List items = [];
  FavoriteViewData favoritedata = FavoriteViewData(Get.find());

  getfavorite() async {
    statusrequest = Statusrequest.loading;
    update();
    var response =
        await favoritedata.getfavorite(services.shared.getString("id")!);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        // list contain maps
        List responsedata = response['data'];
        items.addAll(responsedata.map((e) => Myfavoritemodel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
      update();
    }
  }

  removefavorite(String Favid) {
    var response = favoritedata.removefavorite(Favid);
    items.removeWhere((element) => element.favoriteId == Favid);
    update();
  }

  @override
  void onInit() {
    getfavorite();
    super.onInit();
  }
}
