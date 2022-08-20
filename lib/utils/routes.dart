import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/providers/change_notifiers/home_notifier.dart';
import 'package:safi_e_shop/providers/chats_provider.dart';
import 'package:safi_e_shop/screens/buyer/auth_landing.dart';
import 'package:safi_e_shop/screens/buyer/cart.dart';
import 'package:safi_e_shop/screens/buyer/favourits_screen.dart';
import 'package:safi_e_shop/screens/buyer/home.dart';
import 'package:safi_e_shop/screens/buyer/product_details.dart';
import 'package:safi_e_shop/screens/chats.dart';
import 'package:safi_e_shop/screens/conversation.dart';

import 'package:safi_e_shop/screens/login_screen.dart';
import 'package:safi_e_shop/screens/seller/product_entry.dart';
import 'package:safi_e_shop/screens/seller/seller.dart';
import 'package:safi_e_shop/screens/seller/seller_profile.dart';
import 'package:safi_e_shop/screens/signup_screen.dart';
import 'package:safi_e_shop/sentimental_analysis/comment_analysis.dart';
import 'package:safi_e_shop/screens/buyer/settings_pay.dart';



class Routes {
  //BUYER
  static const home = '/home';
  static const productDetails = '/product_details';
  static const cart = '/cart';
  static const myComment = '/my_comment';
  static const paySettings = '/Payment_settings';
  static const favourits = '/favourit_screen';

  //COMMON
  static const chat = '/chat';
  static const signUp = '/sign_up';
  static const authLanding = '/auth_landing';
  static const loginScreen = '/login_screen';
  static const conversation = '/conversation';
  

  //SELLER
  static const sellerHome = '/seller_home';
  static const sellerProfile = '/seller_profile';
  static const productEntry = '/product_entry';
  

  static Map<String, Widget Function(BuildContext)> appRoutes(
          BuildContext context) =>
      {
        authLanding: (context) => AuthLanding(),
        loginScreen: (context) => LoginScreen(),
        home: (context) => Home(),
        signUp: (context) => SignUp(),
        sellerHome: (context) => Seller(),
        productDetails: (context) => ProductDetails(),
        cart: (context) => Cart(),
        sellerProfile: (context) => SellerProfile(),
        productEntry: (context) => ProductEntry(),
        chat: (context) => ChangeNotifierProvider(
            create: (context) => ChatProvider(), child: Chats()),
        conversation: (context) => Conversation(),
        myComment:(context) => MyComment(),
        paySettings:(context) => SettingsPay(),
        favourits : (context) => FavouritsScreen(),
      };
}
