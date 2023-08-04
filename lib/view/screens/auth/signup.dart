import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/core/constants/imageassets.dart';
import 'package:ecommerceapp/core/functions/alertexitapp.dart';
import 'package:ecommerceapp/view/widget/auth/customauthbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/auth/signupcontroller.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customtextformfield.dart';
import '../../widget/auth/logo.dart';
import '../../widget/auth/textsignup.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    SignupcontrollerImp controller1 = Get.put(SignupcontrollerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Text(
            '17'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.black, fontFamily: 'playfair'),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertexitpp,
            child: GetBuilder<SignupcontrollerImp>(builder: (controller) {
              return (controller.statusrequest != null &&
                      controller.statusrequest == Statusrequest.loading)
                  ? Center(
                      child: LottieBuilder.asset(
                        ImageAssets.loadinglottie,
                        width: 200,
                        height: 200,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.all(35),
                      child: Form(
                        key: controller.formstatesignup,
                        child: ListView(
                          children: [
                            // const LogoAuth(),
                            Text(
                              'Welcome Back',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextFormField(
                              isnumeric: false,
                              valid: (val) {
                                return validate(
                                    val.toString(), 5, 100, 'username');
                              },
                              hint: '23'.tr,
                              icon: Icons.person_2_outlined,
                              label: '20'.tr,
                              mycontroller: controller.username,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              isnumeric: true,
                              valid: (val) {
                                return validate(
                                    val.toString(), 5, 100, 'phone');
                              },
                              hint: '22'.tr,
                              icon: Icons.phone_outlined,
                              label: '21'.tr,
                              mycontroller: controller.phone,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              isnumeric: false,
                              valid: (val) {
                                return validate(
                                    val.toString(), 9, 100, 'email');
                              },
                              hint: '29'.tr,
                              icon: Icons.email_outlined,
                              label: '18'.tr,
                              mycontroller: controller.email,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              isnumeric: false,
                              valid: (val) {
                                return validate(
                                    val.toString(), 7, 100, 'password');
                              },
                              hint: '13'.tr,
                              icon: Icons.lock_outline,
                              label: '19'.tr,
                              mycontroller: controller.password,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomAuthButton(
                              text: '17'.tr,
                              onPressed: () {
                                controller.signup();
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextSignup(
                              ontap: () {
                                controller.gotosignin();
                              },
                              firsttext: '16'.tr,
                              Secondtext: '15'.tr,
                            )
                          ],
                        ),
                      ),
                    );
            })));
  }
}
