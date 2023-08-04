import 'package:ecommerceapp/view/screens/auth/signup.dart';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ArchivedOrdersData {
  Crud crud;
  ArchivedOrdersData(this.crud);

  getarchivedorders(String userid) async {
    var response =
        await crud.postdata(Applink.archivedorders, {"userid": userid});

    return response.fold((l) => l, (r) => r);
  }

  rateorder(String userid, String oderid, String text, String value) async {
    var response = await crud.postdata(Applink.rateorder, {
      "userid": userid,
      "orderid": oderid,
      "ratingvalue": value,
      "ratingtext": text
    });

    return response.fold((l) => l, (r) => r);
  }
}
