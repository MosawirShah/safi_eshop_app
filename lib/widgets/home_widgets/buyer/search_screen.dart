 // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../../utils/routes.dart';
// import 'package:safi_e_shop/repo/network.dart';
// import 'package:safi_e_shop/widgets/home_widgets/buyer/category_item.dart';
//
// import '../../../models/product.dart';
//
// Product? product;
// List<Product>? items;
//
// class SearchScreen extends SearchDelegate{
//   Network network = Network();
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//    return [
//      IconButton(onPressed: (){
//         query = '';
//      }, icon: Icon(Icons.clear)),
//    ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//
//     return IconButton(onPressed: (){
//     }, icon: Icon(Icons.arrow_back));
//
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     network.searchProducts(query);
//     return ListView.builder(
//       itemCount: items!.length,
//         itemBuilder: (context,index)
//         {
//           final product = items![index];
//           return GridContainer(product: product,);
//         },
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     network.searchProducts(query);
//     return ListView.builder(
//         itemCount: items!.length,
//         itemBuilder: (context,index)
//     {
//       final product = items![index];
//       return GridContainer(product: product);
//   }
//     );
// }
// }

class SearchScreen extends StatefulWidget {
  const SearchScreen({this.product,Key? key}) : super(key: key);
  final Product? product;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                cursorColor: Color.fromRGBO(255, 121, 63, 1),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.orange,

                      ),
                    ),
                    hintText: "Search Products",
                    labelStyle: TextStyle(color: Color(0xFF424242))),
                onChanged: (value){
                  setState((){
                    inputValue = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('products').where('title',isGreaterThanOrEqualTo: inputValue).snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child: Text("Something went wrong"),
                      );
                    }
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: Text("Loading..."),
                      );
                    }
                    return Card(
                          elevation: 5,
                          child: ListView(
                            children: snapshot.data!.docs.map((DocumentSnapshot document){
                              Map<String, dynamic> data = document.data() as Map<String,dynamic>;
                              return Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.only(top:5, right: 5, left: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                  border: Border.all(
                                    color: Colors.deepOrangeAccent[100]!,
                                    width: 3

                                  ),
                                ),
                                // height: 100,
                                // width: 100,
                                child: ListTile(
                                  title: Text(data['title']),
                                  leading: Image.network(data['image'],fit: BoxFit.cover, height: 100,width: 100,),
                                  onTap:()=> Navigator.of(context)
                                      .pushNamed(Routes.home),
                                ),
                              );
                            }).toList(),
                          ),
                    );
                  },
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
