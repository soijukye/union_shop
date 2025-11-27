import 'package:flutter/material.dart';

class PriceStyle {
  static const TextStyle oldPrice = TextStyle(
    color: Colors.grey,
    decoration: TextDecoration.lineThrough,
    fontSize: 14,
  );

  static const TextStyle newPrice = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}