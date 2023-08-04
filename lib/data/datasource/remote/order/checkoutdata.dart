import 'package:ecommerceapp/view/screens/auth/signup.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  postdata(Map data) async {
    print(data);
    var response = await crud.postdata(
        Applink.checkout,
        //   'userid': 91,
        //   'address': ' homestaticdata address',
        //   'type': 1,
        //   'shippingprice': 10,
        //   'price': 910,
        //   'coupon': 0,
        //   'paymentmethod': 0,
        //   'discountcoupon': 0
        // }
        //
        data);

    print("from data");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
