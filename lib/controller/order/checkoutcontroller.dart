import 'package:ecommerceapp/controller/adress/viewaddressescontroller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/order/checkoutdata.dart';
import 'package:get/get.dart';

class Checkoutcontroller extends GetxController {
  String paymentmethod = '';
  String deliverymethod = '';
  String shippingaddress = '';
  String? totalprice;
  String coupondiscount = "0";
  String? couponid = "0";
  CheckoutData checkoutdata = CheckoutData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;
  MyServices ser = Get.find();
  String userid = "";

  checkoutt() async {
    if (paymentmethod == '')
      return Get.snackbar("error", "select payment method");
    if (deliverymethod == '')
      return Get.snackbar("error", "select delivery method");
    Map data = {
      "userid": userid,
      "address": deliverymethod.toString() == '0'
          ? "none"
          : shippingaddress.toString(),
      "type": deliverymethod.toString(),
      "shippingprice": "10",
      "price": totalprice.toString(),
      "coupon": couponid.toString(),
      "paymentmethod": paymentmethod.toString(),
      "discountcoupon": coupondiscount.toString()
    };
    print("check out data ");
    print(data);
    statusrequest = Statusrequest.loading;
    update();

    var response = await checkoutdata.postdata(data);
    print("sssssssss$response");
    print(response);
    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.homepage);
        print("success");
      } else {}
    }
    update();
  }

  selectpaymentmethod(String p) {
    paymentmethod = p;
    update();
  }

  selectdeliverymethod(String p) {
    print("selected delevery  method is $p");
    deliverymethod = p;
    update();
  }

  selectshippingaddress(String p) {
    shippingaddress = p;
    update();
  }

  gotohomepage() {
    Get.offAllNamed(AppRoutes.homepage);
  }

  @override
  void onInit() {
    userid = ser.shared.getString("id")!;
    totalprice = Get.arguments['totalprice'];
    coupondiscount = Get.arguments['coupondiscount'];

    couponid =
        Get.arguments['couponid'] == '' ? "0" : Get.arguments['couponid'];
    super.onInit();
  }
}
