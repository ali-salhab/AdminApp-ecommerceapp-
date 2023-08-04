import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addtocart(String userid, String itemid) async {
    var response = await crud
        .postdata(Applink.addtocart, {"userid": userid, "itemid": itemid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  removefromcart(String userid, String itemid) async {
    var response = await crud
        .postdata(Applink.removefromcart, {"userid": userid, "itemid": itemid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  itemcount(String userid, String itemid) async {
    var response = await crud
        .postdata(Applink.itemcount, {"userid": userid, "itemid": itemid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  cartview(String userid) async {
    var response = await crud.postdata(Applink.cartview, {"userid": userid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postdata(Applink.checkcoupon, {"couponname": couponname});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
