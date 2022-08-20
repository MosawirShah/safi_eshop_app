// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {

  final _homeAddressController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _cityAddressController = TextEditingController();

  String? homeAdress;
  String? streetAdress;
  String? cityAdress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 121, 63, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Container(
          // margin: EdgeInsets.only(left: 30),
          child: Text(
            "e-shop",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "KaushanScript-Regular",
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Your Delievery location",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "KaushanScript-Regular",
                color: Colors.black38,
              ),
            ),
          ),
          Image(
            image: AssetImage(
              'assets/images/delievery_img.jpg',
            ),
            height: 130,
            width: 150,
          ),
          ReusableTextField(
              hText: "Enter your House No",
              controllerText: _homeAddressController,
              lText: "House No"),
          ReusableTextField(
              hText: "Enter Street No with CityName",
              controllerText: _streetAddressController,
              lText: "Street No"),
          ReusableTextField(
              hText: "Enter your City Name",
              controllerText: _cityAddressController,
              lText: "City Name"),
          Center(
            child: Container(
              height: 40,
              width: 260,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromRGBO(255, 121, 63, 1),
              ),
              child: RawMaterialButton(
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    homeAdress = _homeAddressController.text;
                    streetAdress = _streetAddressController.text;
                    cityAdress = _cityAddressController.text;
                    List address = [homeAdress, streetAdress, cityAdress];
                    Navigator.of(context).pop(address);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableTextField extends StatelessWidget {
  ReusableTextField(
      {required this.hText,
      required this.controllerText,
      required this.lText,
      Key? key})
      : super(key: key);
  String? hText;
  var controllerText;
  String? lText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 50,
      width: 300,
      child: TextField(
        textAlign: TextAlign.center,
        cursorColor: Color.fromARGB(255, 121, 63, 1),
        controller: controllerText,
        autofocus: false,
        decoration: InputDecoration(
          hintText: "$hText",
          labelText: "$lText",
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Color.fromRGBO(255, 121, 63, 1),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

///GOOGLE MAPS
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class LocationScreen extends StatefulWidget {
//   @override
//   State<LocationScreen> createState() => _LocationScreenState();
// }
//
// class _LocationScreenState extends State<LocationScreen> {
//   Completer<GoogleMapController> _controller = Completer();
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }
