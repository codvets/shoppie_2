import 'package:flutter/material.dart';
import 'package:shoppie/screens/buyer/home.dart';
import 'package:shoppie/screens/login.dart';
import 'package:shoppie/screens/seller/seller_home.dart';
import 'package:shoppie/screens/seller/seller_profile.dart';
import 'package:shoppie/screens/signup_screen.dart';
import 'package:shoppie/screens/splash.dart';

class Routes {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String sellerHome = '/seller_home';
  static const String sellerProfile = '/seller_profile';

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => Home(),
    splash: (context) => Splash(),
    login: (context) => Login(),
    signUp: (context) => SignUp(),
    sellerHome: (context) => Seller(),
    sellerProfile: (context) => SellerProfile(),
  };
}
