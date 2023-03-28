part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? picturePath;
  final String? phoneNumber;
  final String? address;
  final String? houseNumber;
  final String? city;
  static String? token;

  const User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.picturePath,
    this.address,
    this.houseNumber,
    this.city,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        picturePath: data['profile_photo_url'],
        phoneNumber: data['phoneNumber'],
        address: data['address'],
        houseNumber: data['houseNumber'],
        city: data['city'],
      );

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? houseNumber,
    String? phoneNumber,
    String? city,
    String? picturePath,
  }) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          address: address ?? this.address,
          houseNumber: houseNumber ?? this.houseNumber,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          city: city ?? this.city,
          picturePath: picturePath ?? this.picturePath);

  @override
  List<Object> get props => [
        id.toString(),
        picturePath.toString(),
        email.toString(),
        address.toString(),
        houseNumber.toString(),
        phoneNumber.toString(),
        city.toString()
      ];
}

User mockUser = const User(
    id: 1,
    name: 'Denny Octavian',
    email: 'dennyoctavian164@gmail.com',
    address: 'Jalan Menuju Ke Hati Mu',
    houseNumber: '23',
    phoneNumber: '08121181281281',
    city: 'Jakarta',
    picturePath:
        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80');
