import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/providers/home_notifier.dart';
import 'package:shoppie/providers/seller_provider.dart';
import 'package:shoppie/utils/screen_utils.dart';

class SellerProfile extends StatefulWidget {
  const SellerProfile({Key? key}) : super(key: key);

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  File? image;

  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              final imageSource = await ScreenUtils.imagePickOptions(context);

              print(imageSource);

              if (imageSource != null) {
                final file = await ImagePicker().pickImage(source: imageSource);

                if (file != null) {
                  final image = File(file.path);
                  print(image);
                  setState(() {
                    this.image = image;
                  });
                }
              }
            },
            child: this.image == null
                ? CircleAvatar(
                    radius: 80,
                    child: Icon(Icons.camera_alt),
                  )
                : CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(this.image!),
                  ),
          ),
          SizedBox(height: 25),
          TextField(
            onChanged: (va) {
              name = va;
            },
            decoration: InputDecoration(
              hintText: "Edit name",
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (this.image != null || name.length != 0) {
                Provider.of<HomeNotifier>(context, listen: false)
                    .updateProfile(name, this.image!);
              }
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
