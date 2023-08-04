import 'dart:async';

import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:ecommerceapp/core/constants/route.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddAddresscontroller extends GetxController {
  String? lat;
  String? long;
  Statusrequest statusrequest = Statusrequest.none;
  final MapObjectId targetMapObjectId = const MapObjectId('target_placemark');
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);
  final List<MapObject> mapObjects = [];
  Completer<YandexMapController> mapcontroller =
      Completer<YandexMapController>();

  initialcameaposition(YandexMapController controller) async {
    statusrequest = Statusrequest.loading;
    Position pos = await Geolocator.getCurrentPosition();
    lat = pos.latitude.toString();
    long = pos.longitude.toString();

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

  gotoaddaddressdetailspage() async {
    Get.toNamed(AppRoutes.AddressSectionTwo,
        arguments: {"lat": lat, "long": long});
    print(lat);
  }

  onmaptabed(Point p) {
    lat = p.latitude.toString();
    long = p.longitude.toString();
    final placemark = PlacemarkMapObject(
        mapId: targetMapObjectId,
        point: Point(latitude: p.latitude, longitude: p.longitude),
        opacity: 0.9,
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(ImageAssets.place))));

    mapObjects.add(placemark);
    update();
  }

  @override
  void onInit() async {
    Position pos = await Geolocator.getCurrentPosition();
    lat = pos.latitude.toString();
    long = pos.longitude.toString();

    // TODO: implement onInit
    super.onInit();
  }
}
