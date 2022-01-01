import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shoppie/network/network.dart';

class HomeNotifier with ChangeNotifier {
  Category selectedCategory = Category.shirts;

  Network _network = Network();

  void changeCategory(Category category) {
    selectedCategory = category;
    notifyListeners();
  }

  void updateProfile(
    String name,
    File image,
  ) async {
    _network.updateProfile(name, image);
  }
}

enum Category { shirts, pants, clothes, shoes }
