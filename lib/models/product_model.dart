class ProductModel {
  String id;
  String name;
  double price;
  int quantity;
  String picture;
  int pieces;
  int myNum;

  ProductModel(String id, String name, double price, int quantity,
      String picture, int pieces, int number) {
    this.name = name;
    this.id = id;
    this.price = price;
    this.quantity = quantity;
    this.picture = picture;
    this.pieces = pieces;
    this.myNum = number;
  }
}
