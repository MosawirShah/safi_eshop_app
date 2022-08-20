import 'package:flutter/material.dart';
import 'package:safi_e_shop/utils/routes.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.authLanding,
      routes: Routes.appRoutes(context),
    );
  }
}
