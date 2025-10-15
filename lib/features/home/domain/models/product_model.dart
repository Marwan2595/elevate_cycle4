class ProductModel {
  String id;
  String name;
  String image;
  ProductModel({required this.id, required this.name, required this.image});

  @override
  String toString() {
    return '>>>>>>>>ProductModel{id: $id, name: $name, image: $image}';
  }
}
