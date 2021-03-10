import 'package:flutter/material.dart';

class Product {
  final String title, description, category;
  final List<String> images;
  final double rating, price;

  Product({
    @required this.images,
    this.rating = 0.0,
    @required this.title,
    @required this.category,
    @required this.description,
    @required this.price,
  });
}

// demo products

List<Product> demoProducts = [
  Product(
    images: [
      "assets/images/cements.png",
      "assets/images/cements.png",
      "assets/images/cements.png",
      "assets/images/cements.png",
    ],
    title: "Dangote Cement",
    price: 2350.00,
    description: "50kg bag of dangote cement",
    rating: 4.0,
    category: "Cement",
  ),
  Product(
    images: [
      "assets/images/cements.png",
      "assets/images/cements.png",
      "assets/images/cements.png",
      "assets/images/cements.png",
    ],
    title: "Bua Cement",
    price: 3350.00,
    description: "50kg bag of dangote cement",
    rating: 5.0,
    category: "Cement",
  ),
  Product(
    images: [
      "assets/images/cements.png",
      "assets/images/cements.png",
      "assets/images/cements.png",
      "assets/images/cements.png",
    ],
    title: "Elephant Cement",
    price: 3000.00,
    description: "50kg bag of dangote cement",
    rating: 3.0,
    category: "Cement",
  ),
];
