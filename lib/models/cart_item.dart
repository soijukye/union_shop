class CartItem {
  final String id;
  final String productName;
  final String imageUrl;
  final String size;
  final double price;
  final double? oldPrice; // null if not on sale
  int quantity;

  CartItem({
    required this.id,
    required this.productName,
    required this.imageUrl,
    required this.size,
    required this.price,
    this.oldPrice,
    this.quantity = 1,
  });
}
