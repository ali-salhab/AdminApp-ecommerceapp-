import 'package:ecommerceapp/view/screens/auth/signup.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrderdetailsData {
  Crud crud;
  OrderdetailsData(this.crud);

  getdetailsoforder(String orderid) async {
    var response =
        await crud.postdata(Applink.orderdetails, {"orderid": orderid});

    return response.fold((l) => l, (r) => r);
  }
}
