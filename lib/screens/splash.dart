import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/providers/auth_notifier.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<AuthNotifier>(context, listen: false)
          .checkCurrentUser(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splashing"),
      ),
    );
  }
}
