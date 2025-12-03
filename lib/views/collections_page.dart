import 'package:flutter/material.dart';
import 'package:union_shop/widgets/top_navbar.dart';
import 'package:union_shop/widgets/footer_widget.dart';
import 'package:union_shop/models/cart_model.dart';
import 'package:union_shop/widgets/product_card.dart';

class CollectionsPage extends StatefulWidget {

  final CartModel cartModel;
  const CollectionsPage({Key? key, required this.cartModel}) : super(key: key);

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
    @override
    void initState() {
      super.initState();
      // feedbackCallback logic removed; CartModel no longer supports it
    }
  String filter = 'all';

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  List<Map<String, dynamic>> get products => [
        {
          'title': 'Essential T-shirt',
          'price': '£10.00',
          'showStrikethrough': true,
          'newPrice': '£6.99',
          'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_1024x1024@2x.png?v=1759827236',
          'category': 'clothes',
        },
        {
          'title': 'Classic Sweatshirt',
          'price': '£25.00',
          'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Classic_Sweatshirt_1024x1024@2x.png?v=1759827236',
          'category': 'clothes',
        },
        {
          'title': 'Portsmouth Hoodie',
          'price': '£40.00',
          'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Portsmouth_Hoodie_1024x1024@2x.png?v=1759827236',
          'category': 'clothes',
        },
        {
          'title': 'City Magnet',
          'price': '£5.00',
          'imageUrl': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
          'category': 'souvenirs',
        },
        {
          'title': 'Personalised Mug',
          'price': '£12.00',
          'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Personalised_Mug_1024x1024@2x.png?v=1759827236',
          'category': 'souvenirs',
        },
        {
          'title': 'Tote Bag',
          'price': '£8.00',
          'imageUrl': 'https://shop.upsu.net/cdn/shop/files/Tote_Bag_1024x1024@2x.png?v=1759827236',
          'category': 'souvenirs',
        },
      ];

  List<Map<String, dynamic>> get filteredProducts {
    if (filter == 'all') return products;
    return products.where((p) => p['category'] == filter).toList();
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
              onSearch: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Search not implemented.')),
                );
              },
              onBag: () {
                Navigator.pushNamed(context, '/cart');
              },
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
            const SizedBox(height: 24),
            const Text(
              'Collections',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: filter == 'all',
                  onSelected: (_) => setState(() => filter = 'all'),
                  backgroundColor: Colors.grey.shade200,
                  selectedColor: Colors.grey.shade300,
                  checkmarkColor: Colors.black,
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Clothes'),
                  selected: filter == 'clothes',
                  onSelected: (_) => setState(() => filter = 'clothes'),
                  backgroundColor: Colors.grey.shade200,
                  selectedColor: Colors.grey.shade300,
                  checkmarkColor: Colors.black,
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Souvenirs'),
                  selected: filter == 'souvenirs',
                  onSelected: (_) => setState(() => filter = 'souvenirs'),
                  backgroundColor: Colors.grey.shade200,
                  selectedColor: Colors.grey.shade300,
                  checkmarkColor: Colors.black,
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: filteredProducts.map((product) => ProductCard(
                  title: product['title'],
                  price: product['price'],
                  showStrikethrough: product['showStrikethrough'] ?? false,
                  newPrice: product['newPrice'],
                  imageUrl: product['imageUrl'],
                )).toList(),
              ),
            ),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
