import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:forrira/models/item.dart';
import 'package:http/http.dart' as http;

class Data with ChangeNotifier {
  List<Item> _items = [
    // Item(
    //     id: 'v1',
    //     title: 'Tometo',
    //     price: '5',
    //     image: 'assets/images/vega.jpeg',
    //     dept: 'vega',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'v2',
    //     title: 'potetosa',
    //     price: '10',
    //     image: 'assets/images/vega.jpeg',
    //     dept: 'vega',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'v3',
    //     title: 'Tometo',
    //     price: '5',
    //     image: 'assets/images/vega.jpeg',
    //     dept: 'vega',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'v4',
    //     title: 'potetosa',
    //     price: '10',
    //     image: 'assets/images/vega.jpeg',
    //     dept: 'vega',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'v5',
    //     title: 'kossa',
    //     price: '5',
    //     image: 'assets/images/vega.jpeg',
    //     dept: 'vega',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'v6',
    //     title: 'potetosa',
    //     price: '10',
    //     image: 'assets/images/vega.jpeg',
    //     dept: 'vega',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),

    // /////////////

    // Item(
    //     id: 'fr1',
    //     title: 'Roman',
    //     price: '7',
    //     image: 'assets/images/fruit.jpeg',
    //     dept: 'fruit',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'fr2',
    //     title: 'Banana',
    //     price: '10',
    //     image: 'assets/images/fruit1.jpeg',
    //     dept: 'fruit',
    //     can: {'kilo': '5', 'bx3': '15', 'bx5': '25'}),
    // Item(
    //     id: 'fr3',
    //     title: 'roman',
    //     price: '5',
    //     image: 'assets/images/fruit.jpeg',
    //     dept: 'fruit',
    //     can: {'kilo': '6', 'bx3': '18', 'bx5': '30'}),
    // Item(
    //     id: 'fr4',
    //     title: 'apple',
    //     price: '10',
    //     image: 'assets/images/fruit.jpeg',
    //     dept: 'fruit',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'fr5',
    //     title: 'roman',
    //     price: '5',
    //     image: 'assets/images/fruit.jpeg',
    //     dept: 'fruit',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'fr6',
    //     title: 'apple',
    //     price: '10',
    //     image: 'assets/images/fruit.jpeg',
    //     dept: 'fruit',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'fr7',
    //     title: 'roman',
    //     price: '5',
    //     image: 'assets/images/fruit.jpeg',
    //     dept: 'fruit',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'fr8',
    //     title: 'apple',
    //     price: '10',
    //     image: 'assets/images/fruit.jpeg',
    //     dept: 'fruit',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'fr9',
    //     title: 'roman',
    //     price: '5',
    //     image: 'assets/images/fruit.jpeg',
    //     dept: 'fruit',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'fr10',
    //     title: 'apple',
    //     price: '10',
    //     image: 'assets/images/fruit.jpeg',
    //     dept: 'fruit',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // /////////////

    // Item(
    //     id: 'leav1',
    //     title: 'Garger',
    //     price: '5',
    //     image: 'assets/images/leva.jpeg',
    //     dept: 'leav',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'leav2',
    //     title: 'Kospara',
    //     price: '10',
    //     image: 'assets/images/leva.jpeg',
    //     dept: 'leav',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'leav3',
    //     title: 'Garger',
    //     price: '5',
    //     image: 'assets/images/leva.jpeg',
    //     dept: 'leav',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'leav4',
    //     title: 'Kospara',
    //     price: '10',
    //     image: 'assets/images/leva.jpeg',
    //     dept: 'leav',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'leav5',
    //     title: 'garger',
    //     price: '5',
    //     image: 'assets/images/leva.jpeg',
    //     dept: 'leav',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
    // Item(
    //     id: 'leav6',
    //     title: 'kospara',
    //     price: '10',
    //     image: 'assets/images/leva.jpeg',
    //     dept: 'leav',
    //     can: {'kilo': '7', 'bx3': '21', 'bx5': '35'}),
  ];
  Future<void> fetchProducts() async {
    final url = 'https://forer-2bbd4-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      final extractedDAta = json.decode(response.body) as Map<String, dynamic>;
      final List<Item> loadedProducts = [];
      print('00000000000000000000000000000000000000000000000000');

      print(extractedDAta.length);
      extractedDAta.forEach((prodBackId, productData) {
        loadedProducts.add(Item(
            id: productData['id'],
            title: productData['title'],
            price: productData['price'].toString(),
            image: productData['image'],
            dept: productData['dept'],
            can: {'kilo': '5', 'bx3': '6', 'bx5': '6'}));
      });
      _items = loadedProducts;
      print(_items.length);
      notifyListeners();

      print(json.decode(response.body));
    } catch (error) {
      print(error);
      //throw error;
    }
  }

  List get items {
    return _items;
  }

  List get vega {
    return _items.where((item) => item.dept == 'vega').toList();
  }

  List get fruit {
    return _items.where((item) => item.dept == 'fruit').toList();
  }

  List get leav {
    return _items.where((item) => item.dept == 'leav').toList();
  }
}
