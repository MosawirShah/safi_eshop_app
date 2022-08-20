// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
//import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/models/product.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';
import 'package:safi_e_shop/providers/change_notifiers/home_notifier.dart';
import 'package:safi_e_shop/utils/utils.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/bottom_navbar.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/category_builder.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/my_drawer.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/search_screen.dart';
import 'package:safi_e_shop/widgets/home_widgets/category_item.dart';

import 'package:safi_e_shop/widgets/home_widgets/search_bar.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Colors.grey[350],
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.grey, size: 30),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<AuthNotifier>(context, listen: false)
                    .logout(context);
              },
              icon: const Icon(Icons.shop, size: 30, color: Colors.grey)),
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(
                  //   // color: Colors.red,
                  //
                  //   // color: Colors.red,
                  //  // height: ScreenUtils.screenHeight(context) * 0.08,
                  // ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Search items"),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            icon: Align(
                              alignment: Alignment.topCenter,
                              child: Icon(
                                Icons.search_rounded,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchScreen()));
                            },
                          ),
                          // SizedBox(
                          //   width: ScreenUtils.screenWidth(context) * 0.7,
                          //   child: SearchBar(),
                          // ),
                          // const Icon(
                          //   Icons.vertical_split_rounded,
                          //   color: Colors.grey,
                          // ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: ScreenUtils.screenHeight(context) * 0.09,
                    width: ScreenUtils.screenWidth(context) * 0.9,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      // color: Colors.green,
                      height: ScreenUtils.screenHeight(context) * 0.040,
                      child: Column(
                        children: [
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Category",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "See All",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    // color: Colors.blue,
                    height: ScreenUtils.screenHeight(context) * 0.1,
                    child:
                        Consumer<HomeNotifier>(builder: (context, provider, _) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final cat = Category.values[index];
                          return CategoryItem(
                              category: cat,
                              isSelected: cat == provider.selectedCategory);
                        },
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: ScreenUtils.screenHeight(context) * 0.040,
                      child: Column(
                        children: [
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Trending",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtils.screenHeight(context) * 0.5,
                    child:
                        Consumer<HomeNotifier>(builder: (context, provider, _) {
                      return FutureBuilder<List<Product>>(
                        future: provider.getProducts(provider.selectedCategory),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return const Center(
                                  child: Text('No internet connection'));

                            case ConnectionState.waiting:
                              return Center(child: CircularProgressIndicator());

                            case ConnectionState.active:
                              break;
                            case ConnectionState.done:
                              {
                                if (snapshot.hasData) {
                                  final data = snapshot.data!;
                                  if (data.isEmpty) {
                                    return const Center(
                                        child: Text("No products yet found"));
                                  }
                                  return Consumer<HomeNotifier>(
                                    builder: (context, provider, _) {
                                      return CategoryBuilder(items: data);
                                    },
                                  );
                                }
                                return Center(
                                    child: Text("No products yet found"));
                              }
                          }
                          return SizedBox();
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: ScreenUtils.screenHeight(context) * 0.15,
                child: const BottomNavBar(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
