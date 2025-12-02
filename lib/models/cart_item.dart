class CartItem {
  final String id;
  final String productName;
  final String imageUrl;
  final String size;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.productName,
    required this.imageUrl,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}
