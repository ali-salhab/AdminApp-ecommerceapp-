import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Handlingdataview extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const Handlingdataview(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(
            child: LottieBuilder.asset(
              ImageAssets.loadinglottie,
              height: 250,
              width: 250,
            ),
          )
        : statusrequest == Statusrequest.offlinefailure
            ? Center(
                child: LottieBuilder.asset(
                  ImageAssets.nointernetconnectionlottie,
                  height: 250,
                  width: 250,
                ),
              )
            : Center(
                child: statusrequest == Statusrequest.serverfailure
                    ? LottieBuilder.asset(
                        ImageAssets.serverfailurelottie,
                        height: 250,
                        width: 250,
                      )
                    : statusrequest == Statusrequest.failure
                        ? Center(
                            child: LottieBuilder.asset(
                              ImageAssets.nodatalottie,
                              height: 250,
                              width: 250,
                            ),
                          )
                        : widget,
              );
  }
}
//  if (controller.statusrequest == Statusrequest.loading) {
//             return const Center(child: Text('loading'));
//           } else if (controller.statusrequest == Statusrequest.offlinefailure) {
//             return const Center(child: Text('offlinefailure'));
//           } else if (controller.statusrequest == Statusrequest.serverfailure) {
//             return const Center(child: Text('serverfailure'));
//           } else if (controller.statusrequest == Statusrequest.failure) {
//             return const Center(child: Text('no data'));
//           } else {
//             return Text('${controller.data[0]['user_phone']}');
//           }