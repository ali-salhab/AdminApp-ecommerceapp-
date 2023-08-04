import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class NotificationsData {
  Crud crud;
  NotificationsData(this.crud);

  getnotifications(String userid) async {
    var response =
        await crud.postdata(Applink.notifications, {"userid": userid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
