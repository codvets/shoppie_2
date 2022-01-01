import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/app/shop_app.dart';
import 'package:shoppie/providers/auth_notifier.dart';
import 'package:shoppie/providers/home_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => AuthNotifier(),
        ),
        Provider(
          create: (context) => HomeNotifier(),
        )
      ],
      child: const ShopApp(),
    ),
  );
}
