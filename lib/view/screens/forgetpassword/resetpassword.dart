import 'package:ecommerceapp/controller/forgetpassword/resetpasswordcontroller.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:ecommerceapp/view/widget/auth/customauthbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/customtextformfield.dart';

class ResetPasswrd extends StatelessWidget {
  const ResetPasswrd({super.key});

  @override
  Widget build(BuildContext context) {
    ResetpasswordcontrollerImp controller =
        Get.put(ResetpasswordcontrollerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Text(
          'Reset Password',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColors.black, fontFamily: 'playfair'),
        ),
      ),
      body: GetBuilder<ResetpasswordcontrollerImp>(
        builder: (controller) => Container(
          margin: const EdgeInsets.all(35),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                // const LogoAuth(),
                Text(
                  'Enter Your new Password ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 20,
                ),

                CustomTextFormField(
                  isnumeric: false,
                  valid: (val) {
                    return validate(val.toString(), 5, 100, 'password');
                  },
                  hint: '13'.tr,
                  icon: Icons.lock_outlined,
                  label: '35'.tr,
                  mycontroller: controller.firstpassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  isnumeric: false,
                  valid: (val) {
                    return validate(val.toString(), 5, 100, 'password');
                  },
                  hint: '34'.tr,
                  icon: Icons.lock_outlined,
                  label: '35'.tr,
                  mycontroller: controller.secondpassword,
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomAuthButton(
                  text: 'Reset',
                  onPressed: () {
                    controller.changepassword();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
