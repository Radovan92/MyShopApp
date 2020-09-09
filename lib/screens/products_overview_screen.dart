import 'package:flutter/material.dart';
import '../widgets/product_item.dart';

import '../models/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
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
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://www.militaryshop.rs/wp-content/uploads/2019/07/Farmerke-Armoline-crne-2.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Jacket',
      description: 'A new jacket.',
      price: 73.99,
      imageUrl:
          'https://5.imimg.com/data5/DU/CW/MY-5868356/men-s-leather-jacket-500x500.jpg',
    ),
    Product(
      id: 'p4',
      title: 't-shirt',
      description: 'A summer t-shirt',
      price: 55.99,
      imageUrl: 'https://www.djaksport.com/image.aspx?imageId=183815',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(
          loadedProducts[i].id,
          loadedProducts[i].title,
          loadedProducts[i].imageUrl,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
