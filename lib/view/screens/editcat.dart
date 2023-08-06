import 'package:adminapp/controller/editcategoriecontroller.dart';
import 'package:adminapp/core/constants/colors.dart';
import 'package:adminapp/core/functions/uploadfile.dart';
import 'package:adminapp/core/functions/validinput.dart';
import 'package:adminapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditCategorie extends StatelessWidget {
  const EditCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    EditCategorieController controller = Get.put(EditCategorieController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Categorie"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: controller.data!['categories_name'],
                validator: (val) {
                  return validate(val!, 3, 10, "username");
                },
                // controller: controller.nameen,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("  CatnameEn   "),
                    hintText: "Categorie name english",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                initialValue: controller.data!['categories_name_ar'],
                validator: (val) {
                  return validate(val!, 3, 10, "username");
                },
                // controller: controller.nameen,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text("  CatnameEn   "),
                    hintText: "Categorie name english",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18))),
              ),
            ),
            InkWell(
              onTap: () {
                fileuploadgalllery(issvg: true);
              },
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: Get.height / 4,
                child: SvgPicture.network(Applink.categories +
                    "/${controller.data!['categories_image']}"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: MaterialButton(
                height: 50,
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                color: AppColors.primarycolor,
                onPressed: () async {
                  await controller.editcat();
                  // await controller.addcat();
                },
                child: Text("Save updates"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
