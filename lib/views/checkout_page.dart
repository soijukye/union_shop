// TEMPORARY NOTE: This is the CheckoutPage
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
      // TEMPORARY NOTE: You are on the CheckoutPage
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Summary',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    if (cartModel.items.isEmpty)
                      const Text('Your cart is empty.', style: TextStyle(color: Colors.grey)),
                    for (final item in cartModel.items)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(item.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.productName,
                                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                  ),
                                  Text('Size: ${item.size}', style: const TextStyle(color: Colors.grey)),
                                  Text('Qty: ${item.quantity}', style: const TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                            Text(
                              '\u00a3${(item.price * item.quantity).toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
                            ),
                          ],
                        ),
                      ),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                          '\u00a3${cartModel.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: cartModel.items.isEmpty
                            ? null
                            : () {
                                // Only show one SnackBar when payment is processed
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Payment processed!'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text('Pay', style: TextStyle(fontSize: 18, letterSpacing: 1)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
