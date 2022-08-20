// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/models/product.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';
import 'package:safi_e_shop/providers/change_notifiers/home_notifier.dart';
import 'package:safi_e_shop/screens/buyer/home.dart';
import 'package:safi_e_shop/screens/buyer/home.dart';
import 'package:safi_e_shop/utils/routes.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isSelected38 = true;
  bool isSelected40 = false;
  bool isSelected42 = false;
  bool isSelected44 = false;

  Color? color1 = Colors.deepOrange[300];
  Color? color2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 60)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.blueGrey,
                        ),
                        // IconButton(
                        //   onPressed: () {
                        //     Navigator.of(context).pushNamed(Routes.cart);
                        //   },
                        // icon: Icon(Icons.shopping_cart),
                        // color: Colors.blueGrey,
                        //),

                        StreamBuilder<List<Product>>(
                            stream: Provider.of<HomeNotifier>(context,
                                    listen: false)
                                .getCartProducts(Provider.of<AuthNotifier>(
                                        context,
                                        listen: false)
                                    .currentUser
                                    .uid),
                            builder: (context, snapshot) {
                              int cartLength = 0;
                              if (snapshot.data != null) {
                                cartLength = snapshot.data!.length;
                                WidgetsBinding.instance
                                    .addPostFrameCallback((timeStamp) {
                                  Provider.of<HomeNotifier>(context,
                                          listen: false)
                                      .populateCart(snapshot.data!);
                                });
                              }

                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.white70,
                                    // const Color.fromRGBO(255, 121, 63, 1),
                                    child: const Icon(
                                      Icons.shopping_cart,
                                      color: Colors.green,
                                      size: 30,
                                    ),
                                    elevation: 0.1,
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(Routes.cart);
                                    },
                                  ),
                                  if (cartLength > 0)
                                    Positioned(
                                      right: 5,
                                      top: -5,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 14,
                                        child: Text(
                                          cartLength.toString(),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: 50,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(colors: [
                                        //  Color(0xffC18D47),
                                        Color(0xffC17347),
                                        Color(0xffF34C1B),
                                      ])),
                                  child: const Center(
                                    child: Text(
                                      "-30%",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://www.nicepng.com/png/detail/20-207880_picture-id-big-kids-basketball-for-pinterest-nike.png")),
                                  borderRadius: BorderRadius.circular(5),
                                  //color: Colors.orangeAccent,
                                ),
                              ),
                            ],
                          ),

                          //second column
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20)),
                              const Text(
                                "\$180.04",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              const Text(
                                "Nike Orange",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.blueGrey),
                              )
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.only(
                            left: 30,
                          )),
                          Column(
                            children: [
                              const SizedBox(
                                height: 35,
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        //   Color(0xffC18D47),
                                        Color(0xffC17347),
                                        Color(0xffF34C1B),
                                      ])),
                                  child: Center(
                                    child: const Text(
                                      "Buy",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(product.image))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //last container
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.discount == null
                                      ? "\$${product.price}"
                                      : "\$${product.price - (product.price * product.discount! / 100)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Nike Air Shoes",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueGrey),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    homeProvider(context).favorizeProduct(
                                        product,
                                        authProvider(context).currentUser.uid);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Color(0xfff7eacd),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    //   color:Color.fromRGBO(255, 121, 63, 1),
                                    height: 50,

                                    ///
                                    width: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromRGBO(
                                                    255, 121, 63, 1)),
                                      ),
                                      onPressed: () {
                                        homeProvider(context).openChatBox(
                                          context,
                                          otherUserId: product.sellerId,
                                        );
                                      },
                                      child: Text("Chat with Seller"),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    //   color:Color.fromRGBO(255, 121, 63, 1),
                                    height: 50,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromRGBO(
                                                    255, 121, 63, 1)),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed(Routes.myComment,);
                                      },
                                      child: Text("Your comment"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Choose Size",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      isSelected38 = true;
                                      isSelected40 = false;
                                      isSelected42 = false;
                                      isSelected44 = false;
                                    });
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.19,
                                      height: MediaQuery.of(context).size.height *
                                          0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black, width: 2.0),
                                        color: isSelected38 ?color1 : color2,
                                      ),
                                      child: Center(
                                        child: const Text("38",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      )),
                                ),
                                InkWell(
                                  onTap: (){
                                   setState(() {
                                     isSelected38 = false;
                                     isSelected40= true;
                                     isSelected42 = false;
                                     isSelected44 = false;
                                   });
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.19,
                                      height: MediaQuery.of(context).size.height *
                                          0.06,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.black, width: 2.0),
                                          color: isSelected40 ? color1 : color2,
                                      ),
                                      child: Center(
                                        child: const Text("40",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      )),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      isSelected38 = false;
                                      isSelected40= false;
                                      isSelected42 = true;
                                      isSelected44 = false;
                                    });
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.19,
                                      height: MediaQuery.of(context).size.height *
                                          0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black, width: 2.0),
                                        color: isSelected42 ?color1 : color2,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "42",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      isSelected38 = false;
                                      isSelected40 = false;
                                      isSelected42 = false;
                                      isSelected44 = true;
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.19,
                                    height:
                                        MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.black, width: 2.0),
                                      color: isSelected44?color1: color2,
                                    ),
                                    child: const Center(
                                      child: Text("44"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Price\n\$${product.price}.00",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      homeProvider(context).addToCart(
                          product, authProvider(context).currentUser.uid);
                      // Navigator.of(context).pushNamed(Routes.home);

                      // final snackBar = SnackBar(content: Text("Product is Successfully Added"));
                      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      //  showAlertDialog(BuildContext context) {
                      // set up the button
                      Widget okButton = TextButton(
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            //Color.fromRGBO(255, 130, 63, 1)
                          ),
                        ),
                        ///TODO: NEW CHANGES #1
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routes.cart);
                        },
                      );

                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        backgroundColor: Color.fromRGBO(255, 160, 63, 1),
                        title: Text(
                          "Great!",
                          style: TextStyle(
                            color: Colors.white,
                            //Color.fromRGBO(255, 130, 63, 1)
                          ),
                        ),
                        content: Text(
                          "Product is added to your cart.",
                          style: TextStyle(color: Colors.white
                              //Color.fromRGBO(255, 130, 63, 1)
                              ),
                        ),
                        actions: [
                          okButton,
                        ],
                      );
                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    //  },
                    child: Container(
                      height: 65,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(35)),
                        gradient: LinearGradient(
                          colors: [
                            // Color(0xffC18D47),
                            Color(0xffC17347),
                            Color(0xffF34C1B),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  HomeNotifier homeProvider(context, {bool listen = false}) =>
      Provider.of<HomeNotifier>(context, listen: listen);

  AuthNotifier authProvider(context, {bool listen = false}) =>
      Provider.of<AuthNotifier>(context, listen: listen);

}
