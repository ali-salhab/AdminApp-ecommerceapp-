import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class FavoriteViewData {
  Crud crud;
  FavoriteViewData(this.crud);

  getfavorite(String userid) async {
    var response =
        await crud.postdata(Applink.favoriteview, {"userid": userid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  removefavorite(String userid) async {
    var response =
        await crud.postdata(Applink.removefavoriteview, {"favoriteid": userid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
