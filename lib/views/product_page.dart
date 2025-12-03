import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer_widget.dart';
import 'package:union_shop/theme/app_styles.dart';
import 'package:union_shop/widgets/top_navbar.dart';


import 'package:union_shop/models/cart_item.dart';
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
  int quantity = 1;

  final List<String> colors = ['Red', 'Blue', 'Green'];
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  final List<Map<String, dynamic>> products = [
    {
      'title': 'Classic Sweatshirt',
      'price': 25.00,
      'priceStr': '£25.00',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Classic_Sweatshirt_1024x1024@2x.png?v=1759827236',
      'description': 'A classic, cozy sweatshirt for everyday comfort. Soft, warm, and perfect for layering.',
    },
    {
      'title': 'Portsmouth Hoodie',
      'price': 40.00,
      'priceStr': '£40.00',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Portsmouth_Hoodie_1024x1024@2x.png?v=1759827236',
      'description': 'Show your Portsmouth pride with this comfy hoodie. Great for chilly days and casual wear.',
    },
    {
      'title': 'City Magnet',
      'price': 5.00,
      'priceStr': '£5.00',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      'description': 'A fun Portsmouth city magnet for your fridge or collection.',
    },
    {
      'title': 'Personalised Mug',
      'price': 12.00,
      'priceStr': '£12.00',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Personalised_Mug_1024x1024@2x.png?v=1759827236',
      'description': 'Enjoy your favorite drink in a personalized mug. Makes a great gift!',
    },
    {
      'title': 'Tote Bag',
      'price': 8.00,
      'priceStr': '£8.00',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Tote_Bag_1024x1024@2x.png?v=1759827236',
      'description': 'A sturdy tote bag for shopping, books, or everyday use.',
    },
  ];

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToCart(BuildContext context) {
    Navigator.pushNamed(context, '/cart');
  }

  void navigateToSearch(BuildContext context) {
    // Placeholder: implement search navigation if you have a search page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Search not implemented.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TopNavBar(
              onLogoTap: (ctx) => navigateToHome(ctx),
              onSearch: () => navigateToSearch(context),
              onBag: () => navigateToCart(context),
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
            // Essential T-shirt section (unchanged)
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
                  const Text(
                    'Essential T-Shirt',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      PriceStyle(oldPrice: '£10.00', newPrice: '£6.99')
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
                          value: selectedSize,
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
                        setState(() => quantity = parsed);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: (selectedSize == null || quantity < 1)
                          ? null
                          : () {
                              final cartItem = CartItem(
                                id: DateTime.now().millisecondsSinceEpoch.toString(),
                                productName: 'Essential T-shirt',
                                imageUrl: 'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
                                size: selectedSize!,
                                price: 6.99,
                                quantity: quantity,
                              );
                              widget.cartModel.addItem(cartItem);
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Added to cart!')),
                              );
                            },
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
            // Other products detail sections
            for (final product in products)
              Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 32),
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
                          product['imageUrl'],
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
                    Text(
                      product['title'],
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          product['priceStr'],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          final cartItem = CartItem(
                            id: DateTime.now().millisecondsSinceEpoch.toString(),
                            productName: product['title'],
                            imageUrl: product['imageUrl'],
                            size: '',
                            price: product['price'],
                            quantity: 1,
                          );
                          widget.cartModel.addItem(cartItem);
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product['title']} added to cart!')),
                          );
                        },
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
                      product['description'],
                      style: const TextStyle(
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
    );
  }
}
