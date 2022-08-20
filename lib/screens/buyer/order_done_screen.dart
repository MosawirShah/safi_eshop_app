import 'package:flutter/material.dart';
import 'package:safi_e_shop/utils/routes.dart';

class OrderDone extends StatelessWidget {
  const OrderDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.deepOrangeAccent,
            height: 40,
            width: double.infinity,
          ),
          Image(
            image: AssetImage("assets/images/order_done.jpg"),
          ),
          SizedBox(height: 50,),
          Center(
            child: Text(
              "Your Order has been placed 😍 !!!",
              style: TextStyle(
                  fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          // SizedBox(height: 10,),
          // Text('😍',style: TextStyle(fontSize: 22),),
          SizedBox(height: 30,),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(Routes.home);
            },
            child: Text(
              "Move to home screen...",
              style: TextStyle(
                  fontSize: 18, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 50,),
          Container(
            color: Colors.deepOrangeAccent,
            height: 40,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
