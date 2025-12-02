import 'cart_item.dart';

class CartModel {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(CartItem item) {
    // Check if same product and size exists
    final existing = _items.indexWhere((e) => e.productName == item.productName && e.size == item.size);
    if (existing != -1) {
      _items[existing].quantity += item.quantity;
    } else {
      _items.add(item);
    }
  }

  void removeItem(CartItem item) {
    _items.removeWhere((e) => e.id == item.id);
  }

  void increaseQuantity(CartItem item) {
    final idx = _items.indexWhere((e) => e.id == item.id);
    if (idx != -1) {
      _items[idx].quantity++;
    }
  }

  void decreaseQuantity(CartItem item) {
    final idx = _items.indexWhere((e) => e.id == item.id);
    if (idx != -1 && _items[idx].quantity > 1) {
      _items[idx].quantity--;
    } else if (idx != -1) {
      _items.removeAt(idx);
    }
  }

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void clear() {
    _items.clear();
  }
}
