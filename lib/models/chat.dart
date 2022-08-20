import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/models/shoppie_user.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';
import 'package:safi_e_shop/repo/network.dart';

class Chat {
  ShoppieUser? user;
  Timestamp creationTime;
  Timestamp lastUpdatedTime;
  Map<String, dynamic> members;
  String? id;

  Chat(
      {required this.creationTime,
      required this.lastUpdatedTime,
      required this.members,
      this.id,
      this.user});

  static Future<Chat> fromJson(DocumentSnapshot<Map<String, dynamic>> snapshot,
      String currentUserId) async {
    final data = snapshot.data()!;

    final Map<String, dynamic> users = data["members"];

    final userIds = users.keys.toList();

    final otherUserId = userIds.firstWhere((e) => e != currentUserId);

    return Chat(
        creationTime: data["creationTime"],
        lastUpdatedTime: data["lastUpdatedTime"],
        members: data["members"],
        id: snapshot.id,
        user: await getUserById(otherUserId));
  }

  static Future<ShoppieUser?> getUserById(String userId) async {
    final user = await Network().getUserById(userId);
    return user;
  }
}
