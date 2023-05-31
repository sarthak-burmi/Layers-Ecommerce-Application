class CartItem {
  String name;
  String image;
  double amount;
  int quantity;

  CartItem(
      {this.quantity = 1,
      required this.name,
      required this.image,
      required this.amount});
}
