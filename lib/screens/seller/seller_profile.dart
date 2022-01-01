import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellerProfile extends StatelessWidget {
  const SellerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              final file =
                  await ImagePicker().pickImage(source: ImageSource.gallery);

              if (file != null) {
                final image = File(file.path);

                //TODO: Upload to Storage
              }
            },
            child: CircleAvatar(
              radius: 80,
            ),
          ),
          SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              hintText: "Edit name",
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              //TODO: Update profile
            },
            child: Text(
              "Update Profile",
            ),
          )
        ],
      ),
    );
  }
}
