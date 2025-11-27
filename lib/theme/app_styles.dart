import 'package:flutter/material.dart';

class PriceStyle extends StatelessWidget {
  final String oldPrice;
  final String newPrice;

  const PriceStyle({
    Key? key,
    required this.oldPrice,
    required this.newPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          oldPrice,
          style: const TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          newPrice,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}