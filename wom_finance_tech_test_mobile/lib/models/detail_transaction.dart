part of 'models.dart';

class DetailTransaction {
  int? id;
  int? productId;
  int? transactionId;
  int? quantity;
  int? totalPriceItem;
  String? createdAt;
  String? updatedAt;
  Product? product;

  DetailTransaction(
      {this.id,
      this.productId,
      this.transactionId,
      this.quantity,
      this.totalPriceItem,
      this.createdAt,
      this.updatedAt,
      this.product});

  DetailTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    transactionId = json['transaction_id'];
    quantity = json['quantity'];
    totalPriceItem = json['total_price_item'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] == null ? null : Product.fromJson(json['product']);
  }
}
