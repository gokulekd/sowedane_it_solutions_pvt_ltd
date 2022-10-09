import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseauth;
import 'package:sowedane_it_solutions_pvt_ltd/view/screen_home_page.dart';
import 'package:sowedane_it_solutions_pvt_ltd/view/screen_signup_login_navigate.dart';

class FirebaseAuthPage extends StatelessWidget {
  const FirebaseAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: firebaseauth.FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return const ScreenHomePage();
            } else if (snapshot.data == null) {
              return const ScreenSignupLoginNavigate();
            }
            return const Center(
                child:
                    SizedBox(height: 50, child: CircularProgressIndicator()));
          },
        ),
      ),
    );
  }
}
