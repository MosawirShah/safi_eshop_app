// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/providers/change_notifiers/seller_provider.dart';
import 'package:safi_e_shop/utils/utils.dart';

class SellerProfile extends StatelessWidget {
  SellerProfile({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SellerProvider>(
      create: (context) => SellerProvider(context: context),
      builder: (context, _) => Scaffold(
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<SellerProvider>(
              builder: (context, provider, _) {
                return InkWell(
                  onTap: () async {
                    final ImageSource? source =
                        await ScreenUtils.imagePickOptions(context);
                    if (source != null) {
                      final rawFile =
                          await ImagePicker().pickImage(source: source);
                      if (rawFile != null) {
                        provider.setImageToUpload(File(rawFile.path));
                      }
                    }
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: image(provider),
                  ),
                );
              },
            ),
            TextField(
              controller: nameController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(255, 121, 63, 1),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: () {
                Provider.of<SellerProvider>(context, listen: false)
                    .updateProfile(name: nameController.text);
              },
              child: Text("Done"),
            )
          ],
        ),
      ),
    );
  }

  ImageProvider<Object>? image(SellerProvider provider) {
    if (provider.imageToUpload != null) {
      return FileImage(provider.imageToUpload!);
    } else {
      if (provider.user.image != null) {
        return NetworkImage(provider.user.image!);
      } else {
        return null;
      }
    }
  }
}
