import 'package:ecommerceapp/controller/productdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItems extends GetView<ProductDetailsControllerImp> {
  const SubItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...List.generate(
            controller.subitems.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 75,
              height: 60,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 3, spreadRadius: 1)
                  ],
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(188, 219, 105, 12),
                    Color.fromARGB(64, 221, 126, 18)
                  ], stops: [
                    0.1,
                    0.8
                  ]),
                  color: controller.subitems[index]["active"] == '1'
                      ? Color.fromARGB(223, 60, 19, 173)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.7), width: 2)),
              child: Center(
                child: Text(
                  controller.subitems[index]["color"],
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: controller.subitems[index]["active"] == "1"
                            ? Colors.white
                            : Colors.black,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
