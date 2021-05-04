import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:forrira/models/item.dart';
import 'package:forrira/providers/items.dart';
import 'package:http/http.dart' as http;

class CartItem {
  final String id;
  final String dadId;
  final String title;
  final String price;
  final Map<String, Map<String, Object>> boughtCan;
  final String dept;
  final String image;

  CartItem({
    @required this.id,
    @required this.dadId,
    @required this.title,
    @required this.boughtCan,
    @required this.price,
    @required this.dept,
    @required this.image,
  });
}

class Cart with ChangeNotifier {
  //List<CartItem> cartList = [];
  final String token;
  final String userId;
  Cart(this.token, this.userId, this._cartList);

  // Map<String, CartItem> _cartList = {};
  List<CartItem> _cartList = [];
  List<CartItem> get cartlist {
    return [..._cartList];
  }

  Future<void> addCart(String itemId, String title, String dept, String price,
      String image, String keyincan, String prkey, int quant) async {
    //await fetchAndSetOrders();
    print('ppppppppppppppppppppppppppppppppp');
    //print(_cartList.length);
    final url =
        'https://forer-2bbd4-default-rtdb.firebaseio.com/orders/$userId.json?auth=$token';

    final index = _cartList.indexWhere((cartItem) =>
        cartItem.dadId == itemId && cartItem.boughtCan.containsKey(keyincan));
    if (index >= 0) {
      return;
    }
//////
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'dadId': itemId,
            'title': title,
            'price': price,
            'boughtCan': {
              keyincan: {'price': prkey, 'quantity': quant}
            } as Map<String, Map<String, dynamic>>,
            'dept': dept,
            'image': image,
          },
        ),
      );

      _cartList.add(
        CartItem(
          id: json.decode(response.body)['name'],
          dadId: itemId,
          title: title,
          price: price,
          boughtCan: {
            keyincan: {'price': prkey, 'quantity': quant}
          },
          dept: dept,
          image: image,
        ),
      );
      // print('ssssssssssssssssssssssssssssssssss');
      // print(_cartList.length);
      // print(_cartList[_cartList.length - 1].boughtCan);
      // notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> fetchAndSetOrders() async {
    final url =
        'https://forer-2bbd4-default-rtdb.firebaseio.com/orders/$userId.json';
    try {
      final response = await http.get(Uri.parse(url));
      final List<CartItem> loadedData = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print('lllllllllllllllllllllllllllllll');
      //print(extractedData.length);

      if (extractedData == null) {
        return;
      }

      extractedData.forEach((cartid, cartitemData) {
        loadedData.add(
          CartItem(
            id: cartid,
            title: cartitemData['title'],
            dept: cartitemData['dept'],
            price: cartitemData['price'],
            image: cartitemData['image'],
            dadId: cartitemData['dadId'],
            boughtCan: {...cartitemData['boughtCan']},
          ),
        );
      });
      _cartList = loadedData.reversed.toList();

      // print(_cartList.length);

      //print(_cartList[0].boughtCan);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  double get totalAmount {
    if (_cartList.length == 0) {
      return 0;
    }
    var total = 0.0;
    _cartList.forEach((cartItem) {
      cartItem.boughtCan.forEach((key, value) {
        total += double.parse(value['price']) * value['quantity'];
      });
    });
    return total;
  }

  void removeBoughtItem(String cartItemId) {
    CartItem a = _cartList.firstWhere((element) => element.id == cartItemId);
    _cartList.remove(a);
    notifyListeners();
  }

  Future<void> removeFromCart(String id) async {
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
    final url =
        'https://forer-2bbd4-default-rtdb.firebaseio.com/orders/$id.json';
    final existingProducIndex = _cartList.indexWhere((prod) => prod.id == id);
    var existingProduct = _cartList[existingProducIndex];
    _cartList.removeAt(existingProducIndex);
    notifyListeners();
    print('gggggggggggggggggggggggggggggggggggg');
    try {
      final response = await http.delete(Uri.parse(url));
      print(response.body);
      if (response.statusCode >= 400) {
        _cartList.insert(existingProducIndex, existingProduct);
        notifyListeners();
        throw Exception('could not delete it');
      }
      existingProduct = null;
    } catch (error) {
      print(error);
    }
  }
}
