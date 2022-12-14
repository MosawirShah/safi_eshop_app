import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:safi_e_shop/models/analysis_class.dart';
import 'package:safi_e_shop/models/message.dart';
import 'package:safi_e_shop/models/product.dart';
//import 'package:safi_e_shop/models/shoppie_user.dart';
import 'package:safi_e_shop/providers/change_notifiers/auth_notifier.dart';
import 'package:safi_e_shop/repo/network.dart';
import 'package:safi_e_shop/screens/conversation.dart';
import 'package:safi_e_shop/utils/routes.dart';

class HomeNotifier with ChangeNotifier {
  Category selectedCategory = Category.shoes;

  Network _network = Network();

  void changeCategory(Category category) {
    selectedCategory = category;

    notifyListeners();
  }




  ///TODO: NEW CHANGES #2
  List<Product> cartProducts = List.empty(growable: true);

  List<Product> products = List.empty(growable: true);

  void changeQuantity(int quantity, String productId) {
    final indexOfProduct =
        cartProducts.indexWhere((element) => element.id == productId);
    final product = cartProducts[indexOfProduct];

    product.quantity = quantity;

    cartProducts.removeAt(indexOfProduct);
    cartProducts.insert(indexOfProduct, product);
    notifyListeners();
  }
/////////////////////////////////////////////////////////////////////////////


  List<Product> favourit = List.empty(growable: true);

  List<Product> favouritProducts = List.empty(growable: true);

  void changeQuantityFavourit(int quantity, String productId) {
    final indexOfProduct =
    favourit.indexWhere((element) => element.id == productId);
    final favouritProducts= favourit[indexOfProduct];

    favouritProducts.quantity = quantity;

    favourit.removeAt(indexOfProduct);
    favourit.insert(indexOfProduct, favouritProducts);
    notifyListeners();
  }



  /////////////////////////////////////////////////////////////////////
  // Future<void> uploadCommentsAnalysis(
  //   BuildContext context, {
  //   int? counterPos,
  //   int? counterNeg,
  // }) async {
  //   Analysis analysis = Analysis(
  //     counterPos: counterPos,
  //     counterNeg: counterNeg,
  //   );
  //   await _network.uploadCommentsAnalysis(analysis);
  // }

  Future<void> uploadProduct(
    BuildContext context, {
    required File image,
    required String title,
    required String description,
    required double price,
    required String category,
    int? discount,
    required String sellerId,
    int? counterPos,
    int? counterNeg,
  }) async {
    Product product = Product(
      image: "",
      title: title,
      description: description,
      price: price,
      discount: discount,
      category: category,
      sellerId: sellerId,
      id: "",
      counterPos: counterPos,
      counterNeg: counterNeg,
    );

    await _network.uploadProduct(product, image);
  }

  Future<List<Product>> getProducts(Category category) async {
    return await _network.getProducts(category);
  }

  Future<void> favorizeProduct(Product product, String uid) async {
    await _network.favorizeProduct(product, uid);
  }

  Future<void> addToCart(Product product, String uid) async {
    product.quantity = 1;
    await _network.addToCart(product, uid);
  }

  Stream<List<Product>> getCartProducts(String uid) {
    return _network.getCartProducts(uid);
  }

  ///TODO: NEW CHANGES #6
  Stream<List<Product>> getCartFavouritProducts(String uid) {
    return _network.getCartFavouritProducts(uid);
  }

  Future<void> deleteProductFromCart(String productId) async {
    log('BEFORE DELETE: ${cartProducts.length}');
    await _network.deleteProductFromCart(productId: productId).then((value) {
      cartProducts.removeWhere((element) => element.id == productId);
      notifyListeners();
    });
  }

  ///TODO: NEW CHANGES #3
  Future<void> deleteProductFromFavourit(String productId) async {
      log('BEFORE DELETE: ${favourit.length}');
      await _network.deleteProductFromFavourit(productId: productId).then((value) {
        favourit.removeWhere((element) => element.id == productId);
        notifyListeners();
      });
    }


  void populateCart(List<Product> cartItems) {
    cartProducts.clear();
    cartItems.forEach((element) {
      element.quantity = 1;
      cartProducts.add(element);
    });

    notifyListeners();
  }

  Future<void> buyProductsFromCart() async {
    await _network.buyProductsFromCart(cartProducts);
  }

  Future<void> openChatBox(BuildContext context,
      {required String otherUserId, bool? isFromSeller}) async {
    final chatId = await _network.getChatId(
        otherUserId: otherUserId, isFromSeller: isFromSeller);

    Navigator.of(context).pushNamed(
      Routes.conversation,
      arguments: ChatArgs(otherUserId: otherUserId, chatId: chatId!),
    );
  }

  Future<void> sendMessage(context,
      {required String chatId,
      required String sellerId,
      required String message}) async {
    final currentUser =
        Provider.of<AuthNotifier>(context, listen: false).currentUser;
    final msg = Message(
        sentTime: Timestamp.fromDate(DateTime.now()),
        senderId: currentUser.uid,
        senderName: currentUser.name,
        receiverId: sellerId,
        body: message);

    await _network.sendMessage(msg, chatId);
  }


}

enum Category { shoes, clothes, pants, shirts }
