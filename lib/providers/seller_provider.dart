import 'dart:io';

import 'package:flutter/material.dart';

class SellerProvider with ChangeNotifier {
  File? selectedImage;

  void setImage(File image) {
    selectedImage = image;
    notifyListeners();
  }
}
