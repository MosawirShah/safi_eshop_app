// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';
import 'package:safi_e_shop/providers/change_notifiers/home_notifier.dart';
import 'package:safi_e_shop/utils/utils.dart';

class ProductEntry extends StatefulWidget {
  int counterPos = 0;
  int counterNeg = 0;
  // productAnalysis({int? counterPos, int? counterNeg}) {
  //   this.counterPos = counterPos!;
  //   this.counterNeg = counterNeg!;
  // }

  @override
  State<ProductEntry> createState() => _ProductEntryState();
}

class _ProductEntryState extends State<ProductEntry> {
  final _formKey = GlobalKey<FormState>();

  File? file;

  TextEditingController _productController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  String? _category;
  int? _discount;
  // var parser = EmojiParser();
  // var happy = Emoji('happy', '😍');
  // var sad = Emoji('sad', '😞');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final ImageSource? source =
                      await ScreenUtils.imagePickOptions(context);
                  if (source != null) {
                    final rawFile =
                        await ImagePicker().pickImage(source: source);
                    if (rawFile != null) {
                      setState(() {
                        file = File(rawFile.path);
                      });
                    }
                    // final file = File();
                  }
                },
                child: CircleAvatar(
                  backgroundImage: file != null ? FileImage(file!) : null,
                  radius: 100,
                  child: file != null
                      ? SizedBox()
                      : Center(
                          child: Icon(
                            Icons.camera_alt,
                            size: 35,
                          ),
                        ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _productController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Empty field";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text(
                                'Product Title',
                              ),
                              hintText: "Nike Air",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _descriptionController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Empty field";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text(
                                'Description',
                              ),
                              hintText: "Nike Air is good",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _priceController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Empty field";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              label: Text(
                                'Price',
                              ),
                              hintText: "25.00",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField<String>(
                            validator: (val) {
                              if (val == null) {
                                return "Select a category";
                              }

                              return null;
                            },
                            hint: Text("Select category"),
                            onChanged: (val) {
                              _category = val!;
                            },
                            items: categories.map((cat) {
                              return DropdownMenuItem<String>(
                                value: cat,
                                child: Text(cat),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField<int>(
                            hint: Text("Select discount"),
                            onChanged: (val) {
                              _discount = val;
                            },
                            items: discountOptions.map((discount) {
                              return DropdownMenuItem<int>(
                                value: discount,
                                child: Text("${discount.toString()}%"),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 40,
                child: ElevatedButton(
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
                    if (_formKey.currentState!.validate()) {
                      if (file == null || _category == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("File or Category is empty"),
                        ));
                        return;
                      }
                      Provider.of<HomeNotifier>(context, listen: false)
                          .uploadProduct(
                        context,
                        category: _category!,
                        description: _descriptionController.text,
                        title: _productController.text,
                        price: double.parse(_priceController.text),
                        discount: _discount,
                        image: file!,
                        counterPos: widget.counterPos,
                        counterNeg: widget.counterNeg,
                        sellerId:
                            Provider.of<AuthNotifier>(context, listen: false)
                                .currentUser
                                .uid,
                      );
                    }
                  },
                  child: Text('Upload Product'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
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
                      Provider.of<AuthNotifier>(context, listen: false)
                          .logout(context);
                    },
                    child: Text('Log Out'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
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
                      Navigator.pop(context);
                    },
                    child: Text('Move Back'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> categories = ["Shoes", "Clothes", "Pants", "Shirts"];
  List<int> discountOptions = [5, 10, 15, 30];
}
