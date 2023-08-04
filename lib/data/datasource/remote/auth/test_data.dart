import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getdata() async {
    var response = await crud.postdata(Applink.test, {});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
