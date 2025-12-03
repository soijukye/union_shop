import 'package:flutter/material.dart';
import 'package:union_shop/widgets/top_navbar.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/widgets/footer_widget.dart';
import 'package:union_shop/models/cart_model.dart';

class HomeScreen extends StatelessWidget {

  final CartModel cartModel;
  const HomeScreen({super.key, required this.cartModel});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void navigateToCollections(BuildContext context) {
    Navigator.pushNamed(context, '/collections');
  }

  void navigateToCart(BuildContext context) {
    Navigator.pushNamed(context, '/cart');
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
              onLogoTap: navigateToHome,
              onSearch: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Search not implemented.')),
                );
              },
              onBag: () => navigateToCart(context),
            ),
            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
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
                  Positioned(
                    left: 40,
                    bottom: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to the Union Shop',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () => navigateToCollections(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            child: const Text('Shop Collections'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Main content
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Featured Product
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: [
                        ProductCard(
                          title: 'Essential T-shirt',
                          price: '\u00a310.00',
                          showStrikethrough: true,
                          newPrice: '\u00a36.99',
                          imageUrl: 'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
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
                      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: [
                        ProductCard(
                          title: 'Classic Sweatshirt',
                          price: '\u00a325.00',
                          imageUrl: 'https://shop.upsu.net/cdn/shop/files/Classic_Sweatshirt_1024x1024@2x.png?v=1759827236',
                        ),
                        ProductCard(
                          title: 'Portsmouth Hoodie',
                          price: '\u00a340.00',
                          imageUrl: 'https://shop.upsu.net/cdn/shop/files/Portsmouth_Hoodie_1024x1024@2x.png?v=1759827236',
                        ),
                        ProductCard(
                          title: 'City Magnet',
                          price: '\u00a35.00',
                          imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Personalised Mug',
                          price: '\u00a312.00',
                          imageUrl: 'https://shop.upsu.net/cdn/shop/files/Personalised_Mug_1024x1024@2x.png?v=1759827236',
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}