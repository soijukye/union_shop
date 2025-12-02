import 'package:flutter/material.dart';
import 'package:union_shop/views/about_us_page.dart';
import 'package:union_shop/views/collections_page.dart';
import 'package:union_shop/views/product_page.dart';
import 'package:union_shop/views/product_details_page.dart';
import 'package:union_shop/views/home_screen.dart';
import 'package:union_shop/views/cart_page.dart';
import 'package:union_shop/views/checkout_page.dart';
import 'package:union_shop/models/cart_model.dart';


void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatefulWidget {
  const UnionShopApp({super.key});

  @override
  State<UnionShopApp> createState() => _UnionShopAppState();
}

class _UnionShopAppState extends State<UnionShopApp> {
  final CartModel cartModel = CartModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: HomeScreen(cartModel: cartModel),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/product') {
          final args = settings.arguments as Map<String, dynamic>?;
          if (args != null) {
            return MaterialPageRoute(
              builder: (context) => ProductDetailsPage(product: args),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => ProductPage(cartModel: cartModel),
            );
          }
        }
        final routes = <String, WidgetBuilder>{
          '/about': (context) => AboutUsPage(cartModel: cartModel),
          '/cart': (context) => CartPage(cartModel: cartModel),
          '/checkout': (context) => CheckoutPage(cartModel: cartModel),
          '/collections': (context) => CollectionsPage(cartModel: cartModel),
          '/': (context) => HomeScreen(cartModel: cartModel),
        };
        final builder = routes[settings.name];
        if (builder != null) {
          return MaterialPageRoute(builder: builder, settings: settings);
        }
        return null;
      },
    );
  }
}




