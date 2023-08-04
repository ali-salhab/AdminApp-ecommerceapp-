import 'package:ecommerceapp/controller/auth/logincontroller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constants/colors.dart';
import 'package:ecommerceapp/view/widget/auth/customauthbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customtextformfield.dart';
import '../../widget/auth/logo.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogincontrollerImp controller = Get.put(LogincontrollerImp());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Text(
            'Login Page',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.black, fontFamily: 'playfair'),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertexitpp,
          child: GetBuilder<LogincontrollerImp>(
            builder: (controller) => Handlingdataview(
                statusrequest: controller.statusrequest,
                widget: Container(
                  child: WillPopScope(
                      onWillPop: alertexitpp,
                      child: Container(
                        margin: EdgeInsets.all(35),
                        child: Form(
                          key: controller.formstatelogin,
                          child: ListView(
                            children: [
                              const LogoAuth(),
                              Text(
                                'Welcome Back',
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextFormField(
                                isnumeric: false,
                                valid: (val) {
                                  print(val);
                                  return validate(
                                      val.toString(), 10, 100, 'email');
                                },
                                hint: 'Enter Your Email',
                                icon: Icons.email_outlined,
                                label: 'Email',
                                mycontroller: controller.email,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GetBuilder<LogincontrollerImp>(
                                builder: (context) => CustomTextFormField(
                                  isnumeric: false,
                                  ontap: () {
                                    print('icon tapped');
                                    controller.showpassword();
                                  },
                                  ispasswordfield: true,
                                  valid: (val) {
                                    return validate(
                                        val.toString(), 5, 100, 'password');
                                  },
                                  hint: 'Enter Youe Password',
                                  icon: controller.passwordstatus
                                      ? Icons.lock_outlined
                                      : Icons.no_encryption_outlined,
                                  label: 'password',
                                  mycontroller: controller.password,
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    '14'.tr,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: AppColors.primarycolor),
                                  ),
                                ),
                                onTap: () {
                                  controller.gotoforgetpasword();
                                },
                              ),
                              CustomAuthButton(
                                text: '15'.tr,
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextSignup(
                                ontap: () {
                                  controller.gotosignuppage();
                                },
                                firsttext: '16'.tr,
                                Secondtext: '17'.tr,
                              )
                            ],
                          ),
                        ),
                      )),
                )),
          ),
        ));
  }
}
