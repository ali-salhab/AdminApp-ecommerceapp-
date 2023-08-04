import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/route.dart';

import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/cartdata.dart';
import 'package:ecommerceapp/data/model/cartmodel.dart';
import 'package:ecommerceapp/data/model/coupondata.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addtocart(String itemid);
  removefromcart(String itemid);
}

class CartControllerImp extends CartController {
  bool appliedcoupon = false;
  TextEditingController? coupon;
  String couponid = "";
  List<CouponModel> coupondata = [];
  List<CartModel> cartviewdata = [];
  late String totalcount = '';
  late String totalprice = '';
  late String coupondiscount = '0';
  late MyServices services = Get.find();
  Statusrequest statusrequest = Statusrequest.none;

  CartData cartdata = CartData(Get.find());

  @override
  addtocart(String itemid) async {
    statusrequest = Statusrequest.loading;
    update();

    var response =
        await cartdata.addtocart(services.shared.getString('id')!, itemid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        // Get.rawSnackbar(title: "sucess", message: "added to cart");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  gotocheckoutpage() {
    Get.toNamed(AppRoutes.Checkout, arguments: {
      "totalcount": totalcount,
      "totalprice": totalprice,
      "couponid": couponid,
      "coupondiscount": coupondiscount
    });
    print("from cart page aparametes are ${coupondiscount}}");
    print("from cart page aparametes are ${couponid}}");
  }

  @override
  removefromcart(String itemid) async {
    statusrequest = Statusrequest.loading;
    update();

    var response =
        await cartdata.removefromcart(services.shared.getString('id')!, itemid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        // Get.rawSnackbar(title: "sucess", message: "remved from cart");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  Future<int> itemcount(String itemid) async {
    int count = 0;
    statusrequest = Statusrequest.loading;
    update();
    var response =
        await cartdata.itemcount(services.shared.getString('id')!, itemid);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        count = int.parse(response['data']);

//   "cart_userid": "45",
        // "totalprice": "2429",
        // "totalitemcount": "11"
        return count;
      } else {
        statusrequest = Statusrequest.failure;
        return 0;
      }
    }
    return 0;
  }

  cartview(String userid) async {
    statusrequest = Statusrequest.loading;
    update();

    var response = await cartdata.cartview(services.shared.getString('id')!);
    // print("rrrrrrrrrrrrrresponse $response");
    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List re = response["data"];
        cartviewdata.clear();
        cartviewdata.addAll(re.map((e) => CartModel.fromJson(e)));
        totalcount = response['pricecounttotal'][0]['totalitemcount'];
        totalprice = response['pricecounttotal'][0]['totalprice'];
        update();
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  refreshcartpage() async {
    totalcount = "0";
    totalprice = '0';

    await cartview(services.shared.getString('id')!);
  }

  // -------------here coupon
  checkCoupon() async {
    statusrequest = Statusrequest.loading;
    update();

    var response = await cartdata.checkCoupon(coupon!.text.toString());

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        List a = response['data'];
        coupondata.addAll(a.map((e) => CouponModel.fromJson(e)));
        appliedcoupon = true;
        couponid = coupondata[0].couponId.toString();
        coupondiscount = coupondata[0].couponDiscount != null
            ? coupondata[0].couponDiscount!
            : '0';
        calculateaftercoupon();
      } else {
        Get.snackbar('error ', 'Coupon not found !');
      }
    }
    update();
  }

  calculateaftercoupon() {
    double t = 0;
    if (coupondata.isNotEmpty) {
      t = double.parse(totalprice) -
          (double.parse(totalprice) *
              double.parse(coupondata[0].couponDiscount!) /
              100);

      totalprice = t.toString();
    }
  }

  initdata() async {
    await cartview(services.shared.getString("id")!);
  }

  @override
  void onInit() {
    coupon = TextEditingController();
    initdata();
    super.onInit();
  }
}
