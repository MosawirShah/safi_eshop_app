// @dart=2.11
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/app/shop_app.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';
import 'package:safi_e_shop/providers/change_notifiers/home_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;

  // Providers is a statemangement technique
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthNotifier>(
          create: (BuildContext context) {
            return AuthNotifier();
          },
        ),
        ChangeNotifierProvider<HomeNotifier>(
          create: (BuildContext context) {
            return HomeNotifier();
          },
        ),
      ],
      child: const ShopApp(),
    ),
  );
}
