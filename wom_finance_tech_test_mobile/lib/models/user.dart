part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? picturePath;
  final String? phoneNumber;
  final String? address;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.picturePath,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        picturePath: data['profile_photo_url'],
        phoneNumber: data['phoneNumber'],
        address: data['address'],
        createdAt: DateTime.parse(data['created_at']),
        updatedAt: DateTime.parse(data['updated_at']),
      );

  @override
  List<Object> get props => [
        id.toString(),
        picturePath.toString(),
        email.toString(),
        address.toString(),
        phoneNumber.toString(),
        createdAt.toString(),
        updatedAt.toString(),
      ];
}
