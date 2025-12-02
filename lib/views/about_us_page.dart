import 'package:flutter/material.dart';
import '../widgets/footer_widget.dart';
import 'package:union_shop/widgets/top_navbar.dart';


import 'package:union_shop/models/cart_model.dart';

class AboutUsPage extends StatelessWidget {
  // TEMPORARY NOTE: This is the AboutUsPage
  final CartModel cartModel;
  const AboutUsPage({Key? key, required this.cartModel}) : super(key: key);

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
      // TEMPORARY NOTE: You are on the AboutUsPage
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'About Us',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Welcome to the Union Shop!\nWe’re dedicated to giving you the very best University branded products,\nwith a range of clothing and merchandise available to shop all year round!\nWe even offer an exclusive personalisation service!\n'
                                'All online purchases are available for delivery or instore collection!\n'
                                'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.\n'
                                'Happy shopping!\n\n'
                                'The Union Shop & Reception Team​​​​​​​​​',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey, 
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const FooterWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}