import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shoppie/models/product.dart';
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
    await _network.updateProfile(name, image);
  }

  Future<void> uploadProduct(
    BuildContext context, {
    required File image,
    required String title,
    required String description,
    required double price,
    required String category,
    int? discount,
    required String sellerId,
  }) async {
    Product product = Product(
      image: "",
      title: title,
      description: description,
      price: price,
      category: category,
      sellerId: sellerId,
      id: "",
    );

    await _network.uploadProduct(product, image);
  }

  Future<List<Product>> getAllProducts() async {
    final products = await _network.getAllProducts();
    return products;
  }
}

enum Category { shirts, pants, clothes, shoes }
