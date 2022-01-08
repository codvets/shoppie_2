import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/providers/auth_notifier.dart';
import 'package:shoppie/utils/routes.dart';

class Seller extends StatelessWidget {
  const Seller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.sellerProfile);
              },
              child: Text(
                "Profile",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.productEntry);
              },
              child: Text(
                "Product Entry",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(Routes.chat);
              },
              child: Text(
                "Chats",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<AuthNotifier>(context, listen: false)
                    .logOut(context);
              },
              child: Text(
                "Log OUt",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
