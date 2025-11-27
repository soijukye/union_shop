import 'package:flutter/material.dart';

void showTopDropdownMenu(BuildContext context) {
  final overlay = Overlay.of(context);
  final entry = OverlayEntry(
    builder: (context) => Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Material(
        elevation: 8,
        color: Colors.white,
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {/* navigate to home */}, child: const Text('Home')),
              TextButton(onPressed: () {/* navigate to shop */}, child: const Text('Shop')),
              TextButton(onPressed: () {/* navigate to contact */}, child: const Text('Contact')),
            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(entry);

  Future.delayed(const Duration(seconds: 5), () => entry.remove());
}
