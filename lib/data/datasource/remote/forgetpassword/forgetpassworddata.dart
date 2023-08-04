import 'package:ecommerceapp/view/screens/auth/signup.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ForgetpasswordData {
  Crud crud;
  ForgetpasswordData(this.crud);

  postdata(String email) async {
    var response = await crud.postdata(Applink.forgetpassword, {
      "email": email,
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
