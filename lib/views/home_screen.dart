import 'package:flutter/material.dart';
import 'package:union_shop/widgets/dropdown_menu.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/widgets/footer_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: mediaQuery.size.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Container(
                    height: 100,
                    color: Colors.white,
                    child: Column(
                      children: [
                        // Top banner
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          color: const Color(0xFF4d2963),
                          child: const Text(
                            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        // Main header
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    navigateToHome(context);
                                  },
                                  child: Image.network(
                                    'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                                    height: 18,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[300],
                                        width: 18,
                                        height: 18,
                                        child: const Center(
                                          child: Icon(Icons.image_not_supported,
                                              color: Colors.grey),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const Spacer(),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(maxWidth: 600),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.search,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        constraints: const BoxConstraints(
                                          minWidth: 32,
                                          minHeight: 32,
                                        ),
                                        onPressed: placeholderCallbackForButtons,
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.person_outline,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        constraints: const BoxConstraints(
                                          minWidth: 32,
                                          minHeight: 32,
                                        ),
                                        onPressed: placeholderCallbackForButtons,
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.shopping_bag_outlined,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        constraints: const BoxConstraints(
                                          minWidth: 32,
                                          minHeight: 32,
                                        ),
                                        onPressed: placeholderCallbackForButtons,
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.menu,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        constraints: const BoxConstraints(
                                          minWidth: 32,
                                          minHeight: 32,
                                        ),
                                        onPressed: () => SimpleDropdownMenu.show(context),
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
                  ),

                  // Hero Section
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        // Background image
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ),
                        // Content overlay
                        Positioned(
                          left: 24,
                          right: 24,
                          top: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'BIG SALE NOW ON!',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "Save over 20% on our essential range of products. Don't miss out on these limited-time offers available while stocks last!",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 32),
                              ElevatedButton(
                                onPressed: placeholderCallbackForButtons,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4d2963),
                                  foregroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: const Text(
                                  'BROWSE COLLECTION',
                                  style: TextStyle(fontSize: 14, letterSpacing: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          // Essentials section
                          const Text(
                            'ESSENTIALS SECTION',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 48),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount:
                                MediaQuery.of(context).size.width > 600 ? 2 : 1,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 48,
                            children: const [
                              ProductCard(
                                title: 'Essential T-shirt',
                                price: '\u00a310.00',
                                showStrikethrough: true,
                                newPrice: '\u00a36.99',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
                              ),
                            ],
                          ),
                          const SizedBox(height: 48),
                          // Products Section
                          const Text(
                            'PRODUCTS SECTION',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 48),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount:
                                MediaQuery.of(context).size.width > 600 ? 2 : 1,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 48,
                            children: const [
                              ProductCard(
                                title: 'Placeholder Product 1',
                                price: '\u00a310.00',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                              ),
                              ProductCard(
                                title: 'Placeholder Product 2',
                                price: '\u00a315.00',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                              ),
                              ProductCard(
                                title: 'Placeholder Product 3',
                                price: '\u00a320.00',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                              ),
                              ProductCard(
                                title: 'Placeholder Product 4',
                                price: '\u00a325.00',
                                imageUrl:
                                    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                              ),
                            ],
                          ),
                          const SizedBox(height: 80), // Space for footer if content is short
                        ],
                      ),
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