import 'package:ecommerceapp/view/screens/auth/signup.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class Verifycodedata {
  Crud crud;
  Verifycodedata(this.crud);

  postdata(String email, String verifycode) async {
    var response = await crud.postdata(
        Applink.verifycodeforget, {"email": email, "verifycode": verifycode});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
