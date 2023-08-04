import 'package:ecommerceapp/view/screens/auth/signup.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postdata(String email, String verifycode) async {
    var response = await crud.postdata(Applink.verifycode, {
      "verifycode": verifycode,
      "email": email,
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
