// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:safi_e_shop/common/radial_gradient_mask.dart';
import 'package:safi_e_shop/screens/buyer/cart.dart';
import 'package:safi_e_shop/screens/buyer/location_screen.dart';
import 'package:safi_e_shop/utils/utils.dart';

class LocationCard extends StatefulWidget {
  LocationCard({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  String? homeAdress;

  String? streetAdress;

  String? cityAdress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.screenHeight(context) * 0.12,
      width: ScreenUtils.screenWidth(context) * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0, left: 10),
            child: Center(
              child: RadiantGradientMask(
                child: Icon(
                  Icons.location_on,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${homeAdress != null ? homeAdress : "SuperMarket"}, ${streetAdress != null ? streetAdress : "Saddar Bazar"}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${cityAdress != null ? cityAdress : "Peshawar"}, Pakistan",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff9B9BCA),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              tooltip: 'Next Page',
              onPressed: () async{
                var address = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LocationScreen()));

                setState((){
                  homeAdress = address[0];
                  streetAdress = address[1];
                  cityAdress = address[2];
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
