// ignore_for_file: prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:safi_e_shop/screens/buyer/cart.dart';
import 'package:safi_e_shop/screens/buyer/settings_pay.dart';
import 'package:safi_e_shop/utils/routes.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/cart_widgets/payment_details_card.dart';

class SettingsPayment extends StatefulWidget {
  SettingsPayment(
      // {required this.easyPaisa,
      // required this.jazzCash,
      // required this.debitCard}
      );

  // String? easyPaisa;
  // String? jazzCash;
  // String? debitCard;

  @override
  State<SettingsPayment> createState() => _SettingsPaymentState();
}

class _SettingsPaymentState extends State<SettingsPayment> {

  PaymentDetailsCard pay = PaymentDetailsCard();

  String easyPaisa = "EasyPaisa";
  String jazzCash = "JazzCash";
  String debitCard = "Debit-Card";

  late List<String> payMeth;

  final int selectedRadiaValue = 0;

  bool isSelectedEasyPaisa = false;

  bool isSelectedJazzCash = false;

  bool isSelectedDebitCard = false;

  Color? color1 = Colors.deepOrange[300];

  Color? color2 = Colors.white;

  final linkedNumber = TextEditingController();
  final cardNumController = TextEditingController();

  String linkNum = "+92-30490******";
  String cardNumber = "****-3453";

  TextStyle style1 =
      TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold);
  TextStyle style2 =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.normal);

  bool isNormal1 = false;
  bool isNormal2 = false;

  bool isEasypaisaMethod = false;
  bool isJazzCashMethod = false;
  bool isDebitCardMethod = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.065,
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                'Account Options',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 12,
                bottom: 15,
              ),
              child: Text(
                'EasyPaisa / JazzCash:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              child: RaisedButton(
                onPressed: () {
                  showAlertDialog(context);
                  setState(() {
                    isSelectedEasyPaisa = true;
                    isSelectedJazzCash = false;
                    isSelectedDebitCard = false;

                    //Payment Method
                    isEasypaisaMethod = true;
                    isJazzCashMethod = false;
                    isDebitCardMethod = false;
                  });
                },
                color: isSelectedEasyPaisa ? color1 : color2,
                elevation: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: EdgeInsets.only(left: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/easypaisa.png')),
                          ),
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.08,
                          margin: EdgeInsets.only(right: 8),
                        ),
                        Text(
                          '$easyPaisa',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "$linkNum",
                          style: isNormal1 ? style2 : style1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            SizedBox(
              child: RaisedButton(
                onPressed: () {
                  showAlertDialog(context);
                  setState(() {
                    isSelectedEasyPaisa = false;
                    isSelectedJazzCash = true;
                    isSelectedDebitCard = false;

                    //Payment Method
                    isEasypaisaMethod = false;
                    isJazzCashMethod = true;
                    isDebitCardMethod = false;
                  });
                },
                color: isSelectedJazzCash ? color1 : color2,
                elevation: 2,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/jazzcash.jfif")),
                          ),
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.08,
                          margin: EdgeInsets.only(right: 8),
                        ),
                        Text(
                          '$jazzCash',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "$linkNum",
                          style: isNormal2 ? style2 : style1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Container(
              margin: EdgeInsets.only(top: 23),
              child: Text(
                'Credit/Debit Cards: ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  // fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              child: RaisedButton(
                  //color: Colors.white,
                  elevation: 10,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(left: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://icons-for-free.com/iconfiles/png/512/credit+card+debit+card+master+card+icon-1320184902602310693.png')),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.08,
                            margin: EdgeInsets.only(right: 8),
                          ),
                          Text(
                            'Pay with $debitCard',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isSelectedEasyPaisa = false;
                      isSelectedJazzCash = false;
                      isSelectedDebitCard = true;

                      //Payment Method
                      isEasypaisaMethod = false;
                      isJazzCashMethod = false;
                      isDebitCardMethod = true;

                    });
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.amber,
                      builder: (BuildContext context) => Container(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Add Debit/Credit/ATM Card',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextField(
                                // style: TextStyle(color: Colors.white),
                                style: TextStyle(color: Colors.white),
                                controller: cardNumController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: 'Card Number',
                                  hintStyle: TextStyle(
                                    color: Colors.white54,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      // controller: inputtedPhoneNo,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: 'Expiry MM',
                                        hintStyle: TextStyle(
                                          color: Colors.white54,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: TextField(
                                      // style: TextStyle(color: Colors.white),
                                      style: TextStyle(color: Colors.white),
                                      // controller: inputtedPhoneNo,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: 'CVV',
                                        hintStyle: TextStyle(
                                          color: Colors.white54,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: RaisedButton(
                                  color: Color(0xff00001a).withOpacity(0.8),
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      cardNumber = cardNumController.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        color: isSelectedDebitCard ? color1 : color2,
                      ),
                    );
                  }),
            ),
            ///////////////////
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(255, 121, 63, 1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  ///TODO
                  onPressed: () {
                    if(isEasypaisaMethod == true){
                      List linkedData1 = [linkNum, easyPaisa];
                      Navigator.of(context).pop(linkedData1);
                    }
                    else if(isJazzCashMethod == true){
                      List linkedData1 = [linkNum, jazzCash];
                      Navigator.of(context).pop(linkedData1);
                    }
                    else {
                      List linkedData1 = [cardNumber, debitCard];
                      Navigator.of(context).pop(linkedData1);
                    }
                   },
                  child: Text("Proceed"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text(
        "Link Account",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onPressed: () {
        setState(() {
          linkNum = linkedNumber.text;
          if (isNormal1 == false) {
            isNormal2 == true;
            isNormal1 == false;
          } else {
            isNormal1 = true;
            isNormal2 = false;
          }
        });
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Enter Linked Phone Number:",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      content: TextField(
        controller: linkedNumber,
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Ex: +9230599******',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
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
  }
}
