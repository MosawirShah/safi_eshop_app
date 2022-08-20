// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safi_e_shop/screens/buyer/home.dart';
import 'package:safi_e_shop/screens/chats.dart';
import 'package:safi_e_shop/utils/routes.dart';
import 'package:safi_e_shop/widgets/home_widgets/buyer/search_screen.dart';
class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
       // backgroundColor: Colors.grey,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.lightBlueAccent],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                ///TODO: recent changes1
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      elevation: 8.0,
                      child: Container(
                        height: 160.0,
                        width: 160.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1j_25vyCwVyxCOT0BRq-zit3GAYeUp4pQ4Q&usqp=CAU",
                            //EcommerceApp.sharedPreferences.getString(EcommerceApp.userAvatarUrl).toString(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                     // EcommerceApp.sharedPreferences.getString(EcommerceApp.userName).toString(),
                       '${_auth.currentUser!.email}',
                      style: TextStyle(color: Colors.white, fontSize: 35.5, fontFamily: "KaushanScript-Regular"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                padding: EdgeInsets.only(top: 1.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.orange],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.home,color: Colors.white ),
                      title: Text("Home", style: TextStyle(color: Colors.white),),
                      onTap: (){
                       Navigator.pop(context);
                      },
                    ),
                    Divider(height: 10.0, color: Colors.white, thickness: 6.0,),
                    ListTile(
                      leading: Icon(Icons.shopping_cart,color: Colors.white ),
                      title: Text("My Cart", style: TextStyle(color: Colors.white),),
                      onTap: (){
                        Navigator.pushNamed(context, Routes.cart);
                      },
                    ),
                    Divider(height: 10.0, color: Colors.white, thickness: 6.0,),
                    ListTile(
                      leading: Icon(Icons.search,color: Colors.white ),
                      title: Text("Search", style: TextStyle(color: Colors.white),),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchScreen()));
                      },
                    ),

                    Divider(height: 10.0, color: Colors.white, thickness: 6.0,),ListTile(
                      leading: Icon(Icons.exit_to_app,color: Colors.white ),
                      title: Text("Log Out", style: TextStyle(color: Colors.white),),
                      onTap: (){
                        _auth.signOut().then((value) => Navigator.pushNamed(context, Routes.authLanding));
                      },
                    ),
                    Divider(height: 10.0, color: Colors.white, thickness: 6.0,),

                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
