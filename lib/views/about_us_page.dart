import 'package:flutter/material.dart';
import '../widgets/footer_widget.dart';
import 'package:union_shop/widgets/top_navbar.dart';


class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

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
                  TopNavBar(
                    onLogoTap: (ctx) => navigateToHome(ctx),
                    onSearch: placeholderCallbackForButtons,
                    onBag: placeholderCallbackForButtons,
                  ),

                  // About Us content
                  Padding(
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
                ],
              ),
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}