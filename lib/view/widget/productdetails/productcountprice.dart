import 'package:flutter/material.dart';

class ProductCountPrice extends StatelessWidget {
  final void Function()? onPressedminus;
  final void Function()? onPressedplus;
  final String number;
  final String price;
  const ProductCountPrice(
      {super.key,
      this.onPressedminus,
      this.onPressedplus,
      required this.number,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          IconButton(
              onPressed: onPressedminus,
              icon: Icon(
                Icons.remove,
                size: 20,
                color: Colors.black,
              )),
          Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black)),
            child: Center(
                child: Text(
              number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontFamily: 'cairo'),
            )),
          ),
          IconButton(
              onPressed: onPressedplus,
              icon: const Icon(
                Icons.add,
                size: 20,
                color: Colors.black,
              )),
          const Spacer(),
          Text(
            "${price} \$",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.red, fontSize: 30, fontFamily: 'cairo'),
          )
        ],
      ),
    );
  }
}
