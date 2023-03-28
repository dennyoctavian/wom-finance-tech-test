part of 'models.dart';

class Product extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final int price;
  final int stock;
  final DateTime createdAt;
  final DateTime updatedAt;
  int quantity;

  Product({
    required this.id,
    required this.picturePath,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
    this.quantity = 0,
  });

  factory Product.fromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        picturePath: data['picturePath'],
        name: data['name'],
        description: data['description'],
        price: data['price'],
        stock: data['stock'],
        createdAt: DateTime.parse(data['created_at']),
        updatedAt: DateTime.parse(data['updated_at']),
      );

  @override
  List<Object> get props => [
        id,
        picturePath,
        name,
        description,
        price,
        stock,
        createdAt,
        updatedAt,
      ];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = id;
    data['quantity'] = quantity;
    return data;
  }
}
