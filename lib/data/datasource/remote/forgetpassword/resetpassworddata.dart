import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postdata(String email, String password) async {
    var response = await crud.postdata(
        Applink.resetpassword, {"email": email, "password": password});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
