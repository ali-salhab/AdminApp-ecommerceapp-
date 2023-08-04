import 'package:ecommerceapp/controller/home_page_controller.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategories extends GetView<HomepageControllerImp> {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 80,
      child: Container(
        child: ListView.separated(
            separatorBuilder: (context, i) {
              return const SizedBox(
                width: 80,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              // print(
              //     "${Applink.categories}/${controller.categories[0]["categories_image"]}");
              return Categories(
                ontap: () {
                  print("0000000000000000000000000000");
                  print(index);
                  print(
                      controller.categories[index]['categories_id'].toString());
                  // int selectedcat, List categories, String catid
                  // print(controller.categories);
                  // print(controller.categories[index]['categories_id']);
                  controller.gotoitemspage(index, controller.categories,
                      controller.categories[index]['categories_id'].toString());
                },
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]),
              );
            }),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final Function()? ontap;

  final CategoriesModel categoriesModel;
  const Categories(
      {super.key, required this.ontap, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: AppColors.grey,
      ),
      height: 60,
      child: InkWell(
        onTap: ontap,
        child: Column(
          children: [
            SvgPicture.network(
              color: AppColors.primarycolor,
              "${Applink.categories}/${categoriesModel.categoriesImage}",
              // "https://alisalhab.000webhostapp.com/ecommerceapp_backend/upload/categories/camera.svg",

              height: 50,
              width: 50,
            ),
            Text(
                '${translatedatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}')
          ],
        ),
      ),
    );
  }
}
