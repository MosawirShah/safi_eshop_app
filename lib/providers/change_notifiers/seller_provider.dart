import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/models/shoppie_user.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';
import 'package:safi_e_shop/repo/network.dart';

class SellerProvider with ChangeNotifier {
  late ShoppieUser user;

  final Network _network = Network();

  SellerProvider({required BuildContext context}) {
    this.user = Provider.of<AuthNotifier>(context, listen: false).currentUser;
  }

  File? imageToUpload;

  void setImageToUpload(File? image) {
    imageToUpload = image;
    notifyListeners();
  }

  void updateProfile({required String name}) async {
    await _network.updateProfile(name, imageToUpload!).then((url) {
      user.image = url;
      notifyListeners();
    });
  }
}
