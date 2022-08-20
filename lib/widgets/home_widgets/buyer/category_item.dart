// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/models/product.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';
import 'package:safi_e_shop/providers/change_notifiers/home_notifier.dart';
import 'package:safi_e_shop/utils/routes.dart';
import 'package:safi_e_shop/utils/utils.dart';

class GridContainer extends StatelessWidget {
  GridContainer({
    Key? key,
    this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.productDetails, arguments: product);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          // height: ScreenUtils.screenHeight(context) * 0.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    product!.discount == null
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(255, 121, 63, 1),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              onPressed: null,
                              child: SizedBox(
                                width: 30,
                                child: Center(
                                  child: Text(
                                    "${product!.discount.toString()}%",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.grey),
                        onPressed: () {

                          // Provider.of<HomeNotifier>(context, listen: false)
                          //     .favorizeProduct(
                          //   product!,
                          //   Provider.of<AuthNotifier>(context, listen: false)
                          //       .currentUser
                          //       .uid,
                          // );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Container(
                  height: ScreenUtils.screenHeight(context) * 0.10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(product!.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      child: Text(
                        product!.discount != null
                            ? '\$${ScreenUtils.discountedPrice(product!.price, product!.discount!)}'
                            : "\$${product!.price}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (product!.discount != null) Text('\$${product!.price}'),
                  ],
                ),
              ),
              //Text("hi"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text('👍🏽'),
                      // if (cartLength > 0)
                      Positioned(
                        right: 12,
                        top: -5,
                        child: CircleAvatar(
                          backgroundColor: Color.fromRGBO(255, 121, 63, 1),
                          radius: 10,
                          child: Consumer<HomeNotifier>(
                            builder: (context, provider, _) {
                              return Text(
                                product!.counterPos.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight
                                        .bold), // cartLength.toString(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    product!.title,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 3,
                  ),

                  //Stack2
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text('👎🏽'),

                      // if (cartLength > 0)
                      Positioned(
                        right: -12,
                        top: -5,
                        child: CircleAvatar(
                          backgroundColor: Color.fromRGBO(255, 121, 63, 1),
                          radius: 10,
                          child: Text(
                            product!.counterNeg.toString(),
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.white), // cartLength.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
