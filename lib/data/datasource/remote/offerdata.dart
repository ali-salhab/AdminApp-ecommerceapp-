import 'package:ecommerceapp/view/screens/auth/signup.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OfferData {
  Crud crud;
  OfferData(this.crud);

  getdata() async {
    var response = await crud.postdata(Applink.offer, {});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
