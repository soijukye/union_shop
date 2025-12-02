import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer_widget.dart';
import 'package:union_shop/theme/app_styles.dart';
import 'package:union_shop/widgets/top_navbar.dart';

import 'package:union_shop/models/cart_model.dart';

class ProductPage extends StatefulWidget {
  final CartModel cartModel;
  const ProductPage({super.key, required this.cartModel});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? selectedColor;
  String? selectedSize;

  final List<String> colors = ['Red', 'Blue', 'Green'];
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  // TopNavBar widget
                  TopNavBar(
                    onLogoTap: (ctx) => navigateToHome(ctx),
                    onSearch: placeholderCallbackForButtons,
                    onBag: placeholderCallbackForButtons,
                  ),

                  // Product details
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product image
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_720x.png?v=1759827236',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_not_supported,
                                          size: 64,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Image unavailable',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Product name
                        const Text(
                          'Essential T-Shirt',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Product price
                        const Row(
                          children: [
                            PriceStyle(oldPrice: '\u00a310.00', newPrice: '\u00a36.99')
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Color and Size dropdowns
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                initialValue: selectedColor,
                                items: colors.map((color) {
                                  return DropdownMenuItem(
                                    value: color,
                                    child: Text(color),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() => selectedColor = value);
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Color',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                initialValue: selectedSize,
                                items: sizes.map((size) {
                                  return DropdownMenuItem(
                                    value: size,
                                    child: Text(size),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() => selectedSize = value);
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Size',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                        //quantity
                        TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: '1',
                          decoration: const InputDecoration(
                            labelText: 'Quantity',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                        ),

                        const SizedBox(height: 16),
                        // Add to cart button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: placeholderCallbackForButtons,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Product description
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Redesigned with a fresh chest logo, our Essential T-shirts are made for everyday wear with a modern twist. Soft, durable, and effortlessly versatile — these are the elevated basics your wardrobe\'s been waiting for.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const FooterWidget()
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
