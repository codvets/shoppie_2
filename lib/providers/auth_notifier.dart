import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppie/models/shoppie_user.dart';
import 'package:shoppie/network/network.dart';
import 'package:shoppie/utils/routes.dart';

class AuthNotifier with ChangeNotifier {
  final _network = Network();

  ShoppieUser? shoppieUser;

  void checkCurrentUser(BuildContext context) async {
    try {
      shoppieUser = await _network.checkCurrentUser();
      if (shoppieUser!.type == UserType.seller) {
        Navigator.of(context).pushReplacementNamed(Routes.sellerHome);
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      }
    } catch (e) {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }

  Future<void> login(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      shoppieUser = await _network.login(email, password);
      if (shoppieUser!.type == UserType.seller) {
        Navigator.of(context).pushReplacementNamed(Routes.sellerHome);
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      }
    } on FirebaseAuthException catch (error, stk) {
      log("An error occured");
    }
  }

  Future<void> logOut(BuildContext context) async {
    _network.logOut();

    Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) {
      return false;
    });
  }

  Future<void> register(BuildContext context,
      {required String name,
      required String email,
      required String password}) async {
    try {
      final shoppieUser =
          await _network.register(name: name, password: password, email: email);
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } on FirebaseException catch (error, stk) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Unable to Signup"),
          content: Text(
            error.message!,
          ),
        ),
      );
    }
  }
}
