import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sign_button/sign_button.dart';
import 'package:sowedane_it_solutions_pvt_ltd/constant/colors.dart';
import 'package:sowedane_it_solutions_pvt_ltd/controller/fiebase_auth_controller.dart';
import 'package:sowedane_it_solutions_pvt_ltd/view/widgets/commen_textform_field.dart';

// ignore: must_be_immutable
class ScreenSignIn extends StatelessWidget {
  ScreenSignIn({Key? key}) : super(key: key);

  TextEditingController usernameContoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'SIGN IN',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'WELCOME BACK :)',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 11,
              ),
              const Text(
                'To Keep Connected with us please login with your Personal\n information by address and password',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "     Email ID*",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CommenTextFormField(controller: usernameContoller),
                  const SizedBox(height: 26),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "     Password*",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kWhite),
                    ),
                  ),
                  CommenTextFormField(controller: passwordController),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [Text('  Forgot Password ?')],
                    ),
                  ),
                ],
              ),
              //<<<<<<<<<<<<<<<<<<<<<<<<<SIGN UP>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final String username = usernameContoller.text.trim();
                    final String password = passwordController.text.trim();
                    if (username.isEmpty || password.isEmpty) {
                      Get.snackbar("Error", "all field required",
                          backgroundColor: kRed, colorText: kWhite);
                    } else if (username.isNotEmpty && password.isNotEmpty) {
                      FirebaseController()
                          .firebaseUserLogin(username, password);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kOrange,
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: kBlack,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 210,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Or you can join with',
                      style:
                          TextStyle(color: kWhite, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton.mini(
                            buttonType: ButtonType.facebook, onPressed: () {}),
                        SignInButton.mini(
                          buttonType: ButtonType.google,
                          onPressed: () {
                            FirebaseController().googleLogin(context);
                          },
                          elevation: 1,
                        ),
                        SignInButton.mini(
                            buttonType: ButtonType.twitter, onPressed: () {}),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an Account? Click here ",
                        style: const TextStyle(color: kWhite),
                        children: [
                          TextSpan(
                            onEnter: (event) => log('Wornds'),
                            text: 'Register Now',
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: kWhite),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
