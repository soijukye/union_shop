import 'package:flutter/material.dart';
import 'package:union_shop/widgets/top_navbar.dart';
import 'package:union_shop/widgets/footer_widget.dart';
import 'package:union_shop/models/cart_model.dart';

class CheckoutPage extends StatelessWidget {
  final CartModel cartModel;
  const CheckoutPage({Key? key, required this.cartModel}) : super(key: key);

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          const SizedBox(height: 32),
          const Text(
            'Checkout',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'This is a dummy checkout page.\n\nYou can implement payment and order summary here.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          const FooterWidget(),
        ],
      ),
    );
  }
}
