import 'package:flutter/material.dart';
import 'package:shoppie/models/product.dart';

import 'package:shoppie/widgets/grid_container.dart';

class CategoryBuilder extends StatelessWidget {
  CategoryBuilder({
    Key? key,
    required this.items,
  }) : super(key: key);

  List<Product> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final product = items[index];
        return GridContainer(product: product);
      },
      itemCount: items.length,
    );
  }
}
