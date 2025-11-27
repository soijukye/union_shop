import 'package:flutter/material.dart';


class SimpleDropdownMenu extends StatelessWidget {
  final Widget child;

  const SimpleDropdownMenu({super.key, required this.child});

  static final List<_DropdownMenuItemData> _menuItems = [
    _DropdownMenuItemData(
      title: 'Home',
      onTap: (ctx) => Navigator.pushNamed(ctx, '/'),
    ),
    _DropdownMenuItemData(
      title: 'Shop Collections',
      onTap: (ctx) => Navigator.pushNamed(ctx, '/collections'),
    ),
    _DropdownMenuItemData(
      title: 'About',
      onTap: (ctx) => Navigator.pushNamed(ctx, '/about'),
    ),
  ];

  static void show(BuildContext context) {
    final overlay = Overlay.of(context);
    OverlayEntry? entry;
    // Calculate header height (icons + logo)
    final RenderBox? headerBox = context.findRenderObject() is RenderBox
        ? context.findRenderObject() as RenderBox
        : null;
    final double headerHeight = headerBox?.size.height ?? kToolbarHeight * 2;
    entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => entry?.remove(),
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            top: headerHeight,
            left: 0,
            right: 0,
            child: Material(
              elevation: 8,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < _menuItems.length; i++) ...[
                    ListTile(
                      title: Text(_menuItems[i].title),
                      onTap: () {
                        _menuItems[i].onTap(context);
                        entry?.remove();
                      },
                    ),
                    if (i < _menuItems.length - 1) const Divider(height: 1),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
    overlay.insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class _DropdownMenuItemData {
  final String title;
  final void Function(BuildContext) onTap;

  const _DropdownMenuItemData({required this.title, required this.onTap});
}