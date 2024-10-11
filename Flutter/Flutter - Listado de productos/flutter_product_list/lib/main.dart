import 'package:flutter/material.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Listing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    // Puedes agregar más productos o cargarlos de otra fuente aquí.
    Product(
      id: 1,
      title: "Essence Mascara Lash Princess",
      description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects.",
      price: 9.99,
      image: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png",
      reviews: [
        Review(rating: 2, comment: "Very unhappy with my purchase!", reviewerName: "John Doe"),
        Review(rating: 5, comment: "Very satisfied!", reviewerName: "Scarlett Wright"),
      ],
    ),
    // Agrega más productos según tu archivo de artículos
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.image, width: 50),
            title: Text(product.title),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.image),
            SizedBox(height: 10),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(product.description),
            SizedBox(height: 20),
            Text(
              'Reviews:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: product.reviews.length,
                itemBuilder: (context, index) {
                  final review = product.reviews[index];
                  return ListTile(
                    title: Text(review.comment, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Rating: ${review.rating} - ${review.reviewerName}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
