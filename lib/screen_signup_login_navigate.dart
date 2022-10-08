import 'package:flutter/material.dart';

import 'package:sowedane_it_solutions_pvt_ltd/constant/colors.dart';

class ScreenSignupLoginNavigate extends StatelessWidget {
  const ScreenSignupLoginNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      color: kBlack, fontWeight: FontWeight.w500, fontSize: 32),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Easiest Way Manage your Money",
                  style: TextStyle(
                      color: kBlack, fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              const Text(
                "Finance is a gun. Politics is knowing when to pull the Trigger.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kBlack, fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: kBlue,
                  fixedSize: const Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text('SIGN IN WITH GOOGLE'),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: kWhite,
                  fixedSize: const Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'CREATE AN ACCOUNT',
                  style: TextStyle(
                    color: kBlack,
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
