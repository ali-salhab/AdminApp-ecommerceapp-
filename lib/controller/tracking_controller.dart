import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class TrackingController extends GetxController {
  StreamSubscription<Position>? positionStream;
  getcurrentlocation() {
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });
  }

  @override
  void onInit() {
    getcurrentlocation(); // TODO: implement onInit
    super.onInit();
  }
}
