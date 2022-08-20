// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/models/chat.dart';
import 'package:safi_e_shop/models/shoppie_user.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';
import 'package:safi_e_shop/providers/change_notifiers/home_notifier.dart';
import 'package:safi_e_shop/providers/chats_provider.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

//     final user = Provider.of<AuthNotifier>(context, listen: false).currentUser;
//     return Scaffold(
//       body: SafeArea(
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection("chats")
//               .where("members.${user.uid}", isEqualTo: true)
//               .snapshots(),
//           builder: (context, AsyncSnapshot snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.none:
//                 return Center(child: Text("No internet Connection"));
//
//               case ConnectionState.waiting:
//               // TODO: Handle this case.
//                 return Center(child: CircularProgressIndicator());
//
//               case ConnectionState.active:
//                 final data = snapshot.data.docs;
//                 //TODO: Solve your problem
//                 log(data.first.runtimeType.toString());
//
//                 Provider.of<ChatProvider>(context, listen: false)
//                     .formulateChats(data, user.uid);
//
//                 return Consumer<ChatProvider>(builder: (context, provider, _) {
//                   return ListView.builder(
//                       itemCount: provider.chats.length,
//                       itemBuilder: (context, index) {
//                         final chat = provider.chats[index];
//                         return ListTile(
//                           onTap: () {
//                             log("OTHER USER ID: ${chat.user!.uid}");
//                             log(" MY USER ID: ${user.uid}");
//                             Provider.of<HomeNotifier>(context, listen: false)
//                                 .openChatBox(context,
//                                 otherUserId: chat.user!.uid,
//                                 isFromSeller: user.type == UserType.seller
//                                     ? true
//                                     : null);
//                           },
//                           title: Text(chat.user!.name),
//                           leading: CircleAvatar(
//                               radius: 35,
//                               backgroundImage: chat.user!.image == null
//                                   ? null
//                                   : NetworkImage(chat.user!.image!),
//                               child: chat.user!.image == null
//                                   ? CircleAvatar(
//                                 child: Center(
//                                   child: Text(
//                                     chat.user!.name[0],
//                                   ),
//                                 ),
//                               )
//                                   : SizedBox()),
//                         );
//                       });
//                 });
//               case ConnectionState.done:
//                 return SizedBox();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }






    final user = Provider.of<AuthNotifier>(context, listen: false).currentUser;
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 121, 63, 1),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 30),
          child: Text("Safi eshop",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "KaushanScript-Regular",
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("chats")
                .where("members.${user.uid}", isEqualTo: true)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: Text("No internet Connection"));

                case ConnectionState.waiting:
                  // TODO: Handle this case.
                  return Center(child: CircularProgressIndicator());

                case ConnectionState.active:
                  final data = snapshot.data.docs;
                  //TODO: Solve your problem
                  log(data.first.runtimeType.toString());

                  Provider.of<ChatProvider>(context, listen: false)
                      .formulateChats(data, user.uid);

                  return Consumer<ChatProvider>(builder: (context, provider, _) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: provider.chats.length,
                          itemBuilder: (context, index) {
                            final chat = provider.chats[index];
                            return ListTile(
                              onTap: () {
                                log("OTHER USER ID: ${chat.user!.uid}");
                                log(" MY USER ID: ${user.uid}");
                                Provider.of<HomeNotifier>(context, listen: false)
                                     .openChatBox(context,
                                        otherUserId: chat.user!.uid,
                                        isFromSeller: user.type == UserType.seller
                                            ? true
                                            : null);
                              },
                              title: Text(chat.user!.name),
                              leading: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: chat.user!.image == null
                                      ? null
                                      : NetworkImage(chat.user!.image!),
                                  child: chat.user!.image == null
                                      ? CircleAvatar(
                                          child: Center(
                                            child: Text(
                                              chat.user!.name[0],
                                            ),
                                          ),
                                        )
                                      : SizedBox()),
                            );
                          }),
                    );
                  });
                case ConnectionState.done:
                  return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
