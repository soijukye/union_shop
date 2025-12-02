import 'package:flutter/material.dart';
import 'package:union_shop/widgets/dropdown_menu.dart';

class TopNavBar extends StatelessWidget {
  final void Function(BuildContext)? onLogoTap;
  final void Function()? onSearch;
  final void Function()? onBag;

  const TopNavBar({
    Key? key,
    this.onLogoTap,
    this.onSearch,
    this.onBag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        // Navbar
        Container(
          height: 35,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (onLogoTap != null) {
                    onLogoTap!(context);
                  }
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
                      onPressed: onSearch ?? () {},
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
                      onPressed: onBag ?? () {},
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
                      
                      onPressed: () => SimpleDropdownMenu.show(context, 120),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
