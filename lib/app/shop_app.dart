import 'package:flutter/material.dart';
import 'package:shoppie/utils/routes.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splash,
      routes: Routes.routes,
    );
  }
}
