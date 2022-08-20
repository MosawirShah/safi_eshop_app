// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';

class AuthLanding extends StatefulWidget {
  AuthLanding({Key? key}) : super(key: key);

  @override
  State<AuthLanding> createState() => _AuthLandingState();
}

class _AuthLandingState extends State<AuthLanding> {
  String email = '';

  String password = '';

  @override
  void initState() {
    //User admin or user
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AuthNotifier>(context, listen: false)
          .checkCurrentUser(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/splash4.png"),
              height: 130,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 3,
                width: 150,
                decoration: BoxDecoration(
                  border:
                      Border.all(style: BorderStyle.solid, color: Colors.red),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: Text(
                "e_shop",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(255, 90, 45, 40),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'KaushanScript-Regular',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 3,
                width: 150,
                decoration: BoxDecoration(
                  border:
                      Border.all(style: BorderStyle.solid, color: Colors.red),
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
