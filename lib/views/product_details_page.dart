import 'package:flutter/material.dart';
import 'package:union_shop/theme/app_styles.dart';
import 'package:union_shop/widgets/footer_widget.dart';
import 'package:union_shop/widgets/top_navbar.dart';
import 'package:union_shop/models/cart_item.dart';

class ProductDetailsPage extends StatefulWidget {
  // TEMPORARY NOTE: This is the ProductDetailsPage (product details)
  final Map<String, dynamic> product;
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
      bool get isClothing {
        // List of clothing product titles
        const clothingTitles = [
          'Essential T-shirt',
          'Classic Sweatshirt',
          'Portsmouth Hoodie',
        ];
        final title = widget.product['title'] ?? '';
        return clothingTitles.contains(title);
      }
    @override
    void initState() {
      super.initState();
      // Removed feedbackCallback SnackBar logic to prevent duplicate SnackBars
    }
  String? selectedColor;
  String? selectedSize;
  int quantity = 1;
  static final List<String> colors = ['Red', 'Blue', 'Green'];
  static final List<String> sizes = ['S', 'M', 'L', 'XL'];
  static final Map<String, Map<String, dynamic>> productDefaults = {
    'Essential T-shirt': {
      'price': '\u00a310.00',
      'showStrikethrough': true,
      'newPrice': '\u00a36.99',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
      'description': "Redesigned with a fresh chest logo, our Essential T-shirts are made for everyday wear with a modern twist. Soft, durable, and effortlessly versatile — these are the elevated basics your wardrobe's been waiting for.",
    },
    'Classic Sweatshirt': {
      'price': '\u00a325.00',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Classic_Sweatshirt_1024x1024@2x.png?v=1759827236',
      'description': 'A classic, cozy sweatshirt for everyday comfort. Soft, warm, and perfect for layering.',
    },
    'Portsmouth Hoodie': {
      'price': '\u00a340.00',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Portsmouth_Hoodie_1024x1024@2x.png?v=1759827236',
      'description': 'Show your Portsmouth pride with this comfy hoodie. Great for chilly days and casual wear.',
    },
    'City Magnet': {
      'price': '\u00a35.00',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      'description': 'A fun Portsmouth city magnet for your fridge or collection.',
    },
    'Personalised Mug': {
      'price': '\u00a312.00',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Personalised_Mug_1024x1024@2x.png?v=1759827236',
      'description': 'Enjoy your favorite drink in a personalized mug. Makes a great gift!',
    },
    'Tote Bag': {
      'price': '\u00a38.00',
      'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Tote_Bag_1024x1024@2x.png?v=1759827236',
      'description': 'A sturdy tote bag for shopping, books, or everyday use.',
    },
  };

  @override
  Widget build(BuildContext context) {
    // TEMPORARY NOTE: You are on the ProductDetailsPage (product details)
    final cartModel = widget.product['cartModel'];
    // Merge product with defaults for missing fields
    final String title = widget.product['title'] ?? '';
    final Map<String, dynamic> defaults = productDefaults[title] ?? {};
    final String price = widget.product['price'] ?? defaults['price'] ?? '';
    final bool showStrikethrough = widget.product['showStrikethrough'] ?? defaults['showStrikethrough'] ?? false;
    final String? newPrice = widget.product['newPrice'] ?? defaults['newPrice'];
    final String imageUrl = widget.product['imageUrl'] ?? defaults['imageUrl'] ?? '';
    final String description = widget.product['description'] ?? defaults['description'] ?? 'No description available.';
    bool isButtonEnabled = isClothing ? (selectedSize != null && quantity > 0) : (quantity > 0);
    // Parse oldPrice if on sale
    double? oldPriceValue;
    if (showStrikethrough && newPrice != null) {
      oldPriceValue = double.tryParse(price.replaceAll(RegExp(r'[^0-9.]'), ''));
    }
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
                              imageUrl,
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
                          title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (showStrikethrough && newPrice != null)
                          PriceStyle(
                            oldPrice: price,
                            newPrice: newPrice,
                          )
                        else
                          Row(
                            children: [
                              Text(
                                price,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 16),
                        if (isClothing)
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
                                    setState(() {
                                      selectedColor = value;
                                    });
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
                                    setState(() {
                                      selectedSize = value;
                                    });
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
                            setState(() {
                              if (parsed != null && parsed > 0) {
                                quantity = parsed;
                              } else {
                                quantity = 0;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: isButtonEnabled
                                ? () {
                                    if (cartModel != null) {
                                      cartModel.addItem(
                                        CartItem(
                                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                                          productName: title,
                                          imageUrl: imageUrl,
                                          size: selectedSize ?? '',
                                          price: showStrikethrough && newPrice != null
                                              ? double.tryParse(newPrice.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0
                                              : double.tryParse(price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0,
                                          oldPrice: oldPriceValue,
                                          quantity: quantity,
                                        ),
                                        productName: title,
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('$title added to cart!'),
                                          duration: const Duration(seconds: 1),
                                        ),
                                      );
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isButtonEnabled ? const Color(0xFF4d2963) : Colors.grey,
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
                          description,
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