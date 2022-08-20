// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/models/message.dart';
import 'package:safi_e_shop/models/shoppie_user.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';
import 'package:safi_e_shop/providers/change_notifiers/home_notifier.dart';
import 'package:safi_e_shop/providers/chats_provider.dart';
import 'package:safi_e_shop/utils/utils.dart';

class Conversation extends StatelessWidget {

  Conversation({Key? key}) : super(key: key);

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
//
//     final args = ModalRoute.of(context)!.settings.arguments as ChatArgs;
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection("chats")
//             .doc(args.chatId)
//             .collection("messages")
//             .orderBy("sentTime", descending: true)
//             .snapshots(),
//         builder: (context, AsyncSnapshot snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//               return Text("No Internet Connection found");
//             case ConnectionState.waiting:
//               return Center(child: CircularProgressIndicator());
//             case ConnectionState.active:
//             // TODO: Handle this case.
//               final data = snapshot.data.docs;
//
//               final messages =
//               data.map((e) => Message.fromJson(e.data()!)).toList() as List;
//               return Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       reverse: true,
//                       itemCount: messages.length,
//                       itemBuilder: (context, index) {
//                         final message = messages[index] as Message;
//                         final isFromMe = message.senderId ==
//                             Provider.of<AuthNotifier>(context, listen: false)
//                                 .currentUser
//                                 .uid;
//                         return Row(
//                           mainAxisAlignment: isFromMe
//                               ? MainAxisAlignment.end
//                               : MainAxisAlignment.start,
//                           children: [
//                             if (message.senderImageUrl != null)
//                               CircleAvatar(
//                                   backgroundImage:
//                                   NetworkImage(message.senderImageUrl!))
//                             else
//                               CircleAvatar(child: Text(message.senderName[0])),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Text(message.senderName),
//                                   Container(
//                                     padding: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       color: isFromMe
//                                           ? Colors.orange
//                                           : Colors.blue,
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: Text(
//                                       message.body,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 15.0, horizontal: 10),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             textInputAction: TextInputAction.send,
//                             onSubmitted: (val) {
//                               Provider.of<HomeNotifier>(context, listen: false)
//                                   .sendMessage(
//                                 context,
//                                 message: _messageController.text,
//                                 sellerId: args.otherUserId,
//                                 chatId: args.chatId,
//                               );
//                               _messageController.clear();
//                             },
//                             controller: _messageController,
//                           ),
//                         ),
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             Provider.of<HomeNotifier>(context, listen: false)
//                                 .sendMessage(context,
//                                 message: _messageController.text,
//                                 sellerId: args.otherUserId,
//                                 chatId: args.chatId);
//                           },
//                           icon: Icon(
//                             Icons.send,
//                             color: Colors.red,
//                           ),
//                           label: Text("Send"),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               );
//             case ConnectionState.done:
//               return SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }
//
// class ChatArgs {
//   String chatId;
//   String otherUserId;
//
//   ChatArgs({required this.chatId, required this.otherUserId});
// }
//
//




    final user = Provider.of<AuthNotifier>(context, listen: false).currentUser;
    final args = ModalRoute.of(context)!.settings.arguments as ChatArgs;
    return Scaffold(
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
      body:
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage("assets/images/chat_background.jfif"),
                fit: BoxFit.cover,
              ),
              // fit: BoxFit.cover,
            ),

          child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("chats")
                  .doc(args.chatId)
                  .collection("messages")
                  .orderBy("sentTime", descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("No Internet Connection found");
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                    // TODO: Handle this case.
                    final data = snapshot.data.docs;

                    final messages = data
                        .map((e) => Message.fromJson(e.data()!))
                        .toList() as List;
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            reverse: true,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final message = messages[index] as Message;
                              final isFromMe = message.senderId ==
                                  Provider.of<AuthNotifier>(context,
                                          listen: false)
                                      .currentUser
                                      .uid;
                              return Row(
                                mainAxisAlignment: isFromMe
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  if (message.senderImageUrl != null)
                                    CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            message.senderImageUrl!))
                                  else
                                    CircleAvatar(
                                        child: Text(message.senderName[0])),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(message.senderName),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: isFromMe
                                                ? Colors.lightGreen[200]
                                                : Colors.blue[200],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            message.body,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  textInputAction: TextInputAction.send,
                                  onSubmitted: (val) {
                                    Provider.of<HomeNotifier>(context,
                                            listen: false)
                                        .sendMessage(
                                      context,
                                      message: _messageController.text,
                                      sellerId: args.otherUserId,
                                      chatId: args.chatId,
                                    );
                                    _messageController.clear();
                                  },
                                  controller: _messageController,
                                ),
                              ),
                              ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromRGBO(255, 121, 63, 1),
                                  ),
                                ),
                                onPressed: () {
                                  Provider.of<HomeNotifier>(context,
                                          listen: false)
                                      .sendMessage(context,
                                          message: _messageController.text,
                                          sellerId: args.otherUserId,
                                          chatId: args.chatId);
                                },
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                                label: Text("Send"),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
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

class ChatArgs {
  String chatId;
  String otherUserId;

  ChatArgs({required this.chatId, required this.otherUserId});
}
