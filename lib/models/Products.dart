class Products {
  final product_id;
  final product_name;

  Products({this.product_id, this.product_name});

  factory Products.fromMap(Map<String, dynamic> products) {
    return Products(
        product_id: products['product_id'],
        product_name: products['product_name']);
  }
}
