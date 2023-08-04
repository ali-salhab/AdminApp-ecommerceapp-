import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  addaddress(String userid, String name, String city, String lat, String long,
      String street) async {
    var response = await crud.postdata(Applink.addaddress, {
      "userid": userid,
      "city": city,
      "street": street,
      "name": name,
      "lat": lat,
      "long": long
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  viewaddress(String userid) async {
    var response = await crud.postdata(Applink.viewaddresses, {
      "userid": userid,
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  deleteaddress(String addressid) async {
    var response = await crud.postdata(Applink.deleteaddress, {
      "addressid": addressid,
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
