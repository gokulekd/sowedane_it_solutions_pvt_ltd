import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sowedane_it_solutions_pvt_ltd/constant/colors.dart';
import 'package:sowedane_it_solutions_pvt_ltd/model/user_model.dart';
import 'package:sowedane_it_solutions_pvt_ltd/view/screen_home_page.dart';

class FirebaseController {
  final FirebaseAuth firebase = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  firebseUserRegister(String userName, String email, String password) async {
    try {
      await firebase
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        final UserModel data = UserModel(
          uid: value.user!.uid,
          username: value.user!.email!,
          password: password,
          email: email,
        );

        await firestore
            .collection("userData")
            .doc(value.user!.uid)
            .set(data.toJson());

        Get.snackbar("Done",
            "Registration of  ${value.user!.email.toString()} is successful",
            backgroundColor: kGreen, colorText: kWhite);

        Get.to(() => const ScreenHomePage());
        return value;
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: kRed, colorText: kWhite);
    } catch (e) {
      log(e.toString());
    }
  }

  firebaseUserLogin(String email, String password) async {
    try {
      await firebase
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        Get.to(() => const ScreenHomePage());

        Get.snackbar("Done",
            "Registration of  ${value.user!.email.toString()} is successful",
            backgroundColor: kGreen, colorText: kWhite);
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: kRed, colorText: kWhite);
    } catch (e) {
      log(e.toString());
    }
  }

  Future gooleSignOUt() async {
    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: kRed, colorText: kWhite);
    } catch (e) {
      log(e.toString());
    }
  }

  googleLogin(context) async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }
      _user = googleUser;
//
      final googleAuth = await _user!.authentication;
      // log(_user.toString());

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        Get.to(() => const ScreenHomePage());
        final UserModel data = UserModel(
          uid: value.user!.uid,
          username: value.user!.displayName!,
          password: "",
          email: value.user!.email!,
        );

        await firestore
            .collection("userData")
            .doc(value.user!.uid)
            .set(data.toJson());

        Get.snackbar("Done",
            "Registration of  ${value.user!.email.toString()} is successful",
            backgroundColor: kGreen, colorText: kWhite);
        return value;
      });
      showDialog(
        context: context,
        builder: (context) => const Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: kRed, colorText: kWhite);
    } catch (e) {
      log(e.toString());
    }
  }
}
