import 'package:ecommerceapp/view/screens/auth/signup.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class PendingorderData {
  Crud crud;
  PendingorderData(this.crud);

  getpendingorders(String userid) async {
    var response =
        await crud.postdata(Applink.pendingorders, {"userid": userid});

    return response.fold((l) => l, (r) => r);
  }

  deleteorder(String orderid) async {
    var response =
        await crud.postdata(Applink.deleteorder, {"orderid": orderid});

    return response.fold((l) => l, (r) => r);
  }
}
