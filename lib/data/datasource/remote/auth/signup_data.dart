import 'package:ecommerceapp/view/screens/auth/signup.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postdata(String username, String phone, String email, String password) async {
    var response = await crud.postdata(Applink.signup, {
      "username": username,
      "phone": phone,
      "email": email,
      "password": password
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
