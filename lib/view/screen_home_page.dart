import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sowedane_it_solutions_pvt_ltd/constant/colors.dart';
import 'package:sowedane_it_solutions_pvt_ltd/controller/fiebase_auth_controller.dart';
import 'package:sowedane_it_solutions_pvt_ltd/model/user_model.dart';
import 'package:sowedane_it_solutions_pvt_ltd/view/screen_signup_login_navigate.dart';

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("userData")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final UserModel data = UserModel.fromJson(snapshot.data!.data()!);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "User Name : ${data.username}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Email : ${data.email}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {


                          FirebaseController().gooleSignOUt();
                          await FirebaseAuth.instance
                              .signOut()
                              .then((value) async {
                                Get.offAll(()=>const ScreenSignupLoginNavigate());
                            Get.snackbar("Message", "User Log out Success",
                                backgroundColor: kGreen,
                                colorText: Colors.white);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kOrange,
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Log out',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: kBlack,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Text("No data");
          },
        ),
      ),
    );
  }
}
