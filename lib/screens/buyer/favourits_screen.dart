// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/models/product.dart';
import 'package:safi_e_shop/providers/change_notifiers/home_notifier.dart';
import 'package:safi_e_shop/utils/utils.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/cart_widgets/location_card.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/cart_widgets/order_details_card.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/cart_widgets/payment_details_card.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/cart_widgets/product_summar_card.dart';

import '../../widgets/home_widgets/buyer/favourit_product_summary_card.dart';

class FavouritsScreen extends StatelessWidget {
  const FavouritsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<HomeNotifier>(context).favourit;
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: products.isEmpty
          ? Center(child: Column(
        children: [
          AppBar(
            backgroundColor: Color.fromRGBO(255, 121, 63, 1),
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Container(
              margin: EdgeInsets.only(left: 30),
              child: Text("Safi eshop",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "KaushanScript-Regular",
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:200.0),
            child: Text("You hav'nt any fovourit item\nAdd some Items",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),)
          : SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: Color(0xff9B9BCA),
                        ),
                        tooltip: 'Previous Page',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 35.0,
                        right: 30.0,
                        top: 20,
                      ),
                      child: Text(
                        'Favourit Products',
                        style: TextStyle(
                          color: Color(0xff272750),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtils.screenHeight(context) * 0.03,
                ),
                Column(
                  children: products
                      .map((e) => Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8.0),
                    child: FavouritProductSummaryCard(product: e),
                  ))
                      .toList(),
                ),

              ],
            ),
          ),
        ]),
      ),
    );
  }
}
