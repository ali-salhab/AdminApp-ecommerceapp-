import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  removefavorite(String userid, String itemid) async {
    var response = await crud
        .postdata(Applink.removefavorite, {"userid": userid, "itemid": itemid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  addfavorite(String userid, String itemid) async {
    var response = await crud
        .postdata(Applink.addfavorite, {"userid": userid, "itemid": itemid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
