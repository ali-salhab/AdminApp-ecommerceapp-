import 'package:ecommerceapp/view/screens/auth/signup.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postdata(String email, String password) async {
    var response = await crud
        .postdata(Applink.login, {"email": email, "password": password});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
