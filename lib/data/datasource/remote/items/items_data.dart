import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  postdata(String catid, String userid) async {
    var response = await crud
        .postdata(Applink.itemsapi, {"userid": userid, "catid": catid});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
