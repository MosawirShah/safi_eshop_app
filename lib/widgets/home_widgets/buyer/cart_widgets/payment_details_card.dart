// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:safi_e_shop/common/radial_gradient_mask.dart';
import 'package:safi_e_shop/screens/buyer/cart.dart';
import 'package:safi_e_shop/utils/routes.dart';
import 'package:safi_e_shop/utils/utils.dart';
import 'package:safi_e_shop/screens/buyer/settings_pay.dart';

class PaymentDetailsCard extends StatefulWidget {
   PaymentDetailsCard({
   Key? key,
  }) : super(key: key);

   var linkedDataList;
   String nameOfPayMethod = "vissa classic";
   String payMethodNumber = "***-9837";

  @override
  State<PaymentDetailsCard> createState() => _PaymentDetailsCardState();
}

class _PaymentDetailsCardState extends State<PaymentDetailsCard> {
   updateValue(List data){
     setState(() {
       widget.nameOfPayMethod = data[0];
       widget.payMethodNumber = data[1];
     });
   }



   // getData(String nameOfPayMethod, String payMethodNumber){
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
            child: Center(
              child: RadiantGradientMask(
                child: Icon(
                  Icons.credit_card,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 20.0, right: 20.0, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nameOfPayMethod,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.payMethodNumber,
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
            padding: EdgeInsets.only(left: 100, top: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              tooltip: 'Next Page',
              onPressed: ()async{
               widget.linkedDataList = await Navigator.of(context).pushNamed(Routes.paySettings);
               updateValue(widget.linkedDataList);
              },
            ),
          ),
        ],
      ),
    );
  }
}
