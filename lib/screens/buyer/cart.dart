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

class Cart extends StatelessWidget {
   Cart( {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final products = Provider.of<HomeNotifier>(context).cartProducts;
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
                child: Text("Your Cart is Empty\nAdd some Items",
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
                              left: 60.0,
                              right: 50.0,
                              top: 20,
                            ),
                            child: Text(
                              'Order Details',
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
                                  child: ProductSummaryCard(product: e),
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: ScreenUtils.screenHeight(context) * 0.05,
                      ),
                      const Text(
                        'Delivery Location',
                        style: TextStyle(
                          color: Color(0xff272750),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtils.screenHeight(context) * 0.02,
                      ),
                      LocationCard(),
                      SizedBox(
                        height: ScreenUtils.screenHeight(context) * 0.05,
                      ),
                       Text(
                        'Payment Method',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0xff272750),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtils.screenHeight(context) * 0.02,
                      ),
                      PaymentDetailsCard(),
                      SizedBox(
                          height: ScreenUtils.screenHeight(context) * 0.03),
                    ],
                  ),
                ),
                OrderDetailsCard(),
              ]),
            ),
    );
  }
}
