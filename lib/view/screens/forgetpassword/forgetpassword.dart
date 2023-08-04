import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/view/widget/auth/customauthbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/forgetpassword/forgetpasswordcontroller.dart';
import '../../../controller/auth/signupcontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constants/imageassets.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customtextformfield.dart';
import '../../widget/auth/logo.dart';
import '../../widget/auth/textsignup.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetpasswordcontrollerImp controller =
        Get.put(ForgetpasswordcontrollerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Text(
            'Forget Password',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.black, fontFamily: 'playfair'),
          ),
        ),
        body: GetBuilder<ForgetpasswordcontrollerImp>(
            builder: (controller) => Handlingdataview(
                  statusrequest: controller.statusrequest!,
                  widget: Container(
                    margin: const EdgeInsets.all(35),
                    child: ListView(
                      children: [
                        // const LogoAuth(),
                        Text(
                          'Enter Your Email to Get verify code ',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        Form(
                          key: controller.formstate,
                          child: CustomTextFormField(
                            isnumeric: false,
                            valid: (val) {
                              return validate(val.toString(), 10, 100, 'email');
                            },
                            hint: 'Enter Your Email',
                            icon: Icons.email_outlined,
                            label: 'Email',
                            mycontroller: controller.email,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomAuthButton(
                          text: 'Verify',
                          onPressed: () {
                            controller.gotoverifycode();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
