import 'package:flutter/material.dart';
import 'product.dart';

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

  void addProduct() {
    notifyListeners();
  }
}
