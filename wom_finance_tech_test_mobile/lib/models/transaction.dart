part of 'models.dart';

class Transaction {
  int? userId;
  int? totalPrice;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  List<DetailTransaction>? products;

  Transaction(
      {this.userId,
      this.totalPrice,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.products});

  Transaction.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    totalPrice = json['total_price'];
    updatedAt = DateTime.parse(json['updated_at']);
    createdAt = DateTime.parse(json['created_at']);
    id = json['id'];
    products = (json['products'] as List)
        .map((e) => DetailTransaction.fromJson(e))
        .toList();
  }
}
