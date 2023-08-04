import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:flutter/material.dart';

class CustomcartItems extends StatelessWidget {
  final String itemname;
  final String itemprice;
  final String itemtotalcount;
  final String imageurl;
  final void Function()? onpressplus;
  final void Function()? onpressminus;

  const CustomcartItems({
    super.key,
    required this.itemname,
    required this.itemprice,
    required this.itemtotalcount,
    required this.imageurl,
    this.onpressplus,
    this.onpressminus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.black,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: 80,
                height: 80,
                child: CachedNetworkImage(
                  imageUrl: imageurl,
                )),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      "$itemname",
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("$itemprice \$",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: onpressplus,
                    child: Text(
                      "+",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "$itemtotalcount",
                    style: TextStyle(fontSize: 20, fontFamily: 'sans'),
                  ),
                  InkWell(
                    onTap: onpressminus,
                    child: Text(
                      "-",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
