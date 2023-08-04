import 'package:ecommerceapp/controller/adress/addaddress.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/view/screens/address/yandexmaptest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddresscontroller controller = Get.put(AddAddresscontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("add adress from yandex map"),
        ),
        body: GetBuilder<AddAddresscontroller>(
          builder: (controllerrr) => Handlingdataview(
            statusrequest: controllerrr.statusrequest,
            widget: Container(
              child: ListView(
                children: [
                  Container(
                    height: 500,
                    width: 500,
                    child: YandexMap(
                      onMapTap: (Point p) {
                        controller.onmaptabed(p);
                      },
                      mapObjects: controller.mapObjects,
                      mapType: MapType.map,
                      onMapCreated: (YandexMapController c) {
                        controller.mapcontroller.complete(c);
                        controller.initialcameaposition(c);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: AppColors.primarycolor,
                      onPressed: () {
                        controller.gotoaddaddressdetailspage();
                      },
                      child: Text(
                        "add address details",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
