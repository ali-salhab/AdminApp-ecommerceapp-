import 'dart:async';

import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/order/checkoutdata.dart';
import 'package:ecommerceapp/data/datasource/remote/order/orderdetailsdata.dart';
import 'package:ecommerceapp/data/datasource/remote/order/pendingorderdata.dart';
import 'package:ecommerceapp/data/model/orderdetailsmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class Orderdetailscontroller extends GetxController {
  OrderdetailsData orderdetails = OrderdetailsData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;
  Map data = {};
  List<OrderDetailsModel> orderdetail = [];
  String? lat;
  String? long;
  double op = 0;
  ordertotalpricewithshipping() {
    double p = 0;
    for (int i = 0; i < orderdetail.length; i++) {
      p += double.parse(orderdetail[i].orderTotalprice!);
    }

    op = p;
  }

  final MapObjectId targetMapObjectId = const MapObjectId('target_placemark');
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);
  final List<MapObject> mapObjects = [];
  Completer<YandexMapController> mapcontroller =
      Completer<YandexMapController>();

  initialcameaposition(YandexMapController controller, Point pos) async {
    statusrequest = Statusrequest.loading;

    await controller.moveCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            zoom: 10,
            target: Point(latitude: pos.latitude, longitude: pos.longitude))),
        animation: animation);
    statusrequest = Statusrequest.none;
    final placemark = PlacemarkMapObject(
        mapId: targetMapObjectId,
        point: Point(latitude: pos.latitude, longitude: pos.longitude),
        opacity: 0.9,
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(ImageAssets.place))));

    mapObjects.add(placemark);
    update();
  }

  getorderdeyails() async {
    print("from order details controller --------------> ${data['order_id']}");
    statusrequest = Statusrequest.loading;
    update();

    var response = await orderdetails.getdetailsoforder(data["order_id"]);
    print("sssssssss$response");
    print(response);
    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        // List contain maps
        List p = response['data'];
        orderdetail.addAll(p.map((e) => OrderDetailsModel.fromJson(e)));
      } else {}
    }
    update();
  }

  initdat() async {
    await getorderdeyails();
  }

  @override
  void onInit() async {
    ordertotalpricewithshipping();
    data = await Get.arguments["data"];
    print("data from pending orders controller ");
    print(data);
    initdat();
    super.onInit();
  }
}
