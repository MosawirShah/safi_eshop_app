// // ignore_for_file: prefer_const_constructors
// // ignore_for_file: prefer_const_constructors, prefer_final_fields
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/models/product.dart';
import 'package:safi_e_shop/screens/seller/product_entry.dart';
import 'package:safi_e_shop/sentimental_analysis/classifier.dart';
import 'package:safi_e_shop/utils/utils.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/category_item.dart';
import '../providers/change_notifiers/auth_notifier.dart';
import '../providers/change_notifiers/home_notifier.dart';
import '../repo/network.dart';

class MyComment extends StatefulWidget {
  @override
  _MyCommentState createState() => _MyCommentState();
  
}

class _MyCommentState extends State<MyComment> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Product? product;
  int counterPos = 0;
  int counterNeg = 0;
  TextEditingController _controller =  TextEditingController();
  Classifier _classifier = Classifier();
  List<Widget> _children = [];
  // _children.add(Container());
  @override
  void initState() {
    super.initState();
    _children.add(Container());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 217, 211, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 121, 63, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 30),
          child: Text(
            "Safi eshop",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "KaushanScript-Regular",
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(children: <Widget>[
        Center(
          //heightFactor: 4,
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0, bottom: 50),
            child: Container(
              width: 300,
              child: TextField(
                cursorColor: Color.fromRGBO(255, 121, 63, 1),
                maxLines: 4,
                decoration: const InputDecoration(
                    hintText: 'Write comment here',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(255, 121, 63, 1),
                      ),
                    )),
                controller: _controller,
              ),
            ),
          ),
        ),
        RawMaterialButton(
          fillColor: Color.fromRGBO(255, 121, 63, 1),
          child: const Text(
            'Comment',
            style: TextStyle(color: Colors.white),
          ),

          ///TODO: SEARCH FOR SNAPSHOT
          onPressed: () {
            Future getDocs() async {
              QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("products").get();
              for (int i = 0; i < querySnapshot.docs.length; i++) {
                var a = querySnapshot.docs[i];

              }
            }
            final text = _controller.text;
            final prediction = _classifier.classify(text);
            if (prediction[1] > prediction[0]) {
             // counterPos++;
              
            //  print(counterPos);
            //  var data = p
           var ref =  firestore.collection('products');
           ref.doc('1659365368280').update({
             'counterPos' : counterPos,
           });
             setState(() {
               counterPos;
             });

            } else {
            // counterNeg++;
              print(counterNeg);
              
            };
            
            _controller.clear();
          },
        ),
      ]),
      bottomNavigationBar: Container(
        color: Colors.deepOrange,
        height: 20,
        width: ScreenUtils.screenWidth(context),
      ),
    );
  }
}
