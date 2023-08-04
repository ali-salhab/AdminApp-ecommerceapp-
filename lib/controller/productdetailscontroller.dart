import 'package:ecommerceapp/controller/cartcontroller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialdata();
  gotocartpage();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemmodel;
  Statusrequest statusrequest = Statusrequest.none;
  int count = 0;
  CartControllerImp cartcontroller = Get.put(CartControllerImp());
  List subitems = [
    {"id": "1", "active": "1", "color": "red"},
    {"id": "2", "active": "1", "color": "blue"},
    {"id": "3", "active": "0", "color": "green"},
    {"id": "4", "active": "1", "color": "yello"},
  ];
  @override
  void onInit() {
    print("init products contrller ============>");

    initialdata();
    super.onInit();
  }

  onpressplus() {
    count += 1;
    cartcontroller.addtocart(itemmodel.itemId!);
    update();
  }

  onpressminus() {
    count <= 0 ? count : count--;
    cartcontroller.removefromcart(itemmodel.itemId!);
    update();
  }

  @override
  initialdata() async {
    count = 0;
    statusrequest = Statusrequest.loading;

    itemmodel = Get.arguments['productdetails'];

    count = await cartcontroller.itemcount(itemmodel.itemId.toString());

    statusrequest = Statusrequest.success;
    update();
  }

  @override
  gotocartpage() {
    Get.toNamed(AppRoutes.cart);
  }
}
