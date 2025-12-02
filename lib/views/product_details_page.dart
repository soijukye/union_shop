import 'package:flutter/material.dart';
import 'package:union_shop/theme/app_styles.dart';
import 'package:union_shop/widgets/footer_widget.dart';
import 'package:union_shop/widgets/top_navbar.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);
  static final List<String> colors = ['Red', 'Blue', 'Green'];
  static final List<String> sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    String? selectedColor;
    String? selectedSize;
    int quantity = 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopNavBar(
            onLogoTap: (ctx) => Navigator.of(ctx).pushNamedAndRemoveUntil('/', (route) => false),
            onSearch: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search not implemented.')),
              );
            },
            onBag: () => Navigator.of(context).pushNamed('/cart'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              product['imageUrl'] ?? '',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
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
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          product['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        if ((product['showStrikethrough'] ?? false) && product['newPrice'] != null)
                          PriceStyle(
                            oldPrice: product['price'] ?? '',
                            newPrice: product['newPrice'] ?? '',
                          )
                        else
                          Row(
                            children: [
                              Text(
                                product['price'] ?? '',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: selectedColor,
                                items: colors.map((color) {
                                  return DropdownMenuItem(
                                    value: color,
                                    child: Text(color),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  selectedColor = value;
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
                                value: selectedSize,
                                items: sizes.map((size) {
                                  return DropdownMenuItem(
                                    value: size,
                                    child: Text(size),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  selectedSize = value;
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
                        TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: quantity.toString(),
                          decoration: const InputDecoration(
                            labelText: 'Quantity',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                          onChanged: (val) {
                            final parsed = int.tryParse(val);
                            if (parsed != null && parsed > 0) {
                              quantity = parsed;
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {}, // Add to cart logic can be added here
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product['description'] ?? 'No description available.',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const FooterWidget(),
    );
  }
}