// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/cart_widgets/payment_settings.dart';

//import '../../widgets/settings-screen-widgets/settings_payment.dart';

class SettingsPay extends StatelessWidget {
  // String easyPaisa = "EasyPaisa";
  // String jazzCash = "JazzCash";
  // String debitCard = "DebitCard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 121, 63, 1),
        title: Text(
          'Account',
        ),
      ),
      body: SettingsPayment(),
    );
  }
}