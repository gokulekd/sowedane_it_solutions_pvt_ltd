import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sowedane_it_solutions_pvt_ltd/user_signup.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 200,
            child: Lottie.asset("assets/loading.json"),
          ),
        ),
      ),
    );
  }
}

void navigate(context) async {
  await Future.delayed(const Duration(seconds: 3));
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ScreenSignUp(),
    ),
  );
}
