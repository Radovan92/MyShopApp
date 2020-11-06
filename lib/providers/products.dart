import 'package:flutter/material.dart';
import 'product.dart';
import 'dart:convert';
import 'package:http/http.dart ' as http;

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Jeans',
      description: 'New Jeans by Zara',
      price: 50.00,
      imageUrl:
          'https://static.zara.net/photos///2020/I/0/1/p/0774/901/400/2/w/1920/0774901400_6_3_1.jpg?ts=1594831736183',
    ),
    Product(
      id: 'p3',
      title: 'Shoes',
      description: 'Beautifful shoes for autumn',
      price: 100.50,
      imageUrl:
          'https://st2.depositphotos.com/1020663/5572/i/950/depositphotos_55721067-stock-photo-expensive-shoes-autumn-brown-on.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Jacket',
      description: 'New jacket for autumn',
      price: 75.5,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/616mBLv7d6L._AC_UY1000_.jpg',
    ),
  ];

  //var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //  return _items.where((prodItem) => prodItem.isFavorite).toList();
//}
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  //void showFavoritesOnly() {
  //  _showFavoritesOnly = true;
  //  notifyListeners();
  //}

  //void showAll() {
  //  _showFavoritesOnly = false;
  //  notifyListeners();
  //}

  void addProduct(Product product) {
    const url = 'https://shopapp-89849.firebaseio.com/products.json';
    http.post(url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavorite': product.isFavorite,
        }));
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
