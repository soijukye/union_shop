import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2024 Union Shop',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to Terms
                    },
                    child: const Text('Terms'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to Privacy
                    },
                    child: const Text('Privacy'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to Contact
                    },
                    child: const Text('Contact'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}