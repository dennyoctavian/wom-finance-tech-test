part of 'models.dart';

class Transaction extends Equatable {
  final int id;
  final List<Product>? products;
  final int? totalPrice;
  final User? user;

  const Transaction({
    required this.id,
    required this.products,
    this.totalPrice,
    this.user,
  });

  factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
        id: data['id'],
        products: data['products'] == null
            ? null
            : (data['products'] as List)
                .map((product) => Product.fromJson(product))
                .toList(),
        totalPrice: data['total_price'],
      );

  Transaction copyWith(
      {int? id, List<Product>? products, int? totalPrice, User? user}) {
    return Transaction(
        id: id ?? this.id,
        products: products ?? this.products,
        totalPrice: totalPrice ?? this.totalPrice,
        user: user ?? this.user);
  }

  @override
  List<Object> get props =>
      [id, products ?? const [], totalPrice ?? 0, user ?? ''];
}

// List<Transaction> mockTransaction = [
//   Transaction(
//       id: 1,
//       food: mockFoods[0],
//       quantity: 10,
//       total: (mockFoods[1].price * 10 * 1.1).round() + 50000,
//       dateTime: DateTime.now(),
//       status: TransactionStatus.on_delivery,
//       user: mockUser),
//   Transaction(
//       id: 2,
//       food: mockFoods[1],
//       quantity: 7,
//       total: (mockFoods[2].price * 7 * 1.1).round() + 50000,
//       dateTime: DateTime.now(),
//       status: TransactionStatus.delivered,
//       user: mockUser),
//   Transaction(
//       id: 2,
//       food: mockFoods[2],
//       quantity: 5,
//       total: (mockFoods[2].price * 5 * 1.1).round() + 50000,
//       dateTime: DateTime.now(),
//       status: TransactionStatus.cancelled,
//       user: mockUser),
// ];
