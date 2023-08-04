import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/items/items_data.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initdata();
  ontapcat(int val);
  getitems(String catid, String userid);
  gotoproductdetails(ItemsModel itemmodle);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  List items = [];
  Statusrequest statusrequest = Statusrequest.none;
  ItemsData itemsdata = ItemsData(Get.find());
  MyServices serv = Get.find();
  int? selectedcat;
  String? catid;
  @override
  initdata() {
    categories = Get.arguments['categories'];
    selectedcat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getitems(catid!, serv.shared.getString('id')!);
  }

  getitems(String catid, String userid) async {
    items = [];
    statusrequest = Statusrequest.loading;
    update();
    var response = await itemsdata.postdata(catid, userid);
    // print('.,,,,,,,,,,,,,,,, selected cat items ,,,,,,,,,,,,,,,,,,,,,,,,');
    // print("=================response $response");
    update();

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        items.addAll(response['data']);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
  }

  @override
  void onInit() {
    catid = Get.arguments['catid'];

    initdata();
    super.onInit();
  }

  @override
  ontapcat(int val) {
    String catid = categories[val]['categories_id'].toString();
    selectedcat = val;
    // catid=categories[val][''];
    getitems(catid, serv.shared.getString('id')!);
    update();
  }

  @override
  gotoproductdetails(ItemsModel itemmodel) {
    Get.toNamed(AppRoutes.productdetails,
        arguments: {"productdetails": itemmodel});
  }
}
