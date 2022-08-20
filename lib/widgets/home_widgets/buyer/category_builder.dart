// ignore_for_file: dead_code

import 'package:flutter/material.dart';
//import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:safi_e_shop/models/product.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/category_item.dart';

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
           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              childAspectRatio:0.9,),
      itemBuilder: (context, index) {
        final product = items[index];

        return GridContainer(product: product);
      },
      //scrollDirection: Axis.vertical,
      itemCount: items.length,
    );
  }
}
