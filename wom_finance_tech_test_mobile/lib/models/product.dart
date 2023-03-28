part of 'models.dart';

class Product extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final int price;
  final int stock;

  const Product({
    required this.id,
    required this.picturePath,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        picturePath: data['picture_path'],
        name: data['name'],
        description: data['description'],
        price: data['price'],
        stock: data['stock'],
      );

  @override
  List<Object> get props => [id, picturePath, name, description, price, stock];
}

List<Product> mockProducts = [
  const Product(
    id: 1,
    picturePath:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
    name: 'Sate Sayur Sultan',
    description:
        "Bosan dengan sate ayam madura, kini aku coba membuat sate ayam dengan saus spesial. Rasa asam dari jeruk limau, pedas dari cabe rawit membuat saus ini sangat menyegarkan. Dijamin tambah nasi hihi",
    price: 20000,
    stock: 10,
  ),
  const Product(
    id: 2,
    picturePath:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
    name: 'Sate Sayur Sultan',
    description:
        "Bosan dengan sate ayam madura, kini aku coba membuat sate ayam dengan saus spesial. Rasa asam dari jeruk limau, pedas dari cabe rawit membuat saus ini sangat menyegarkan. Dijamin tambah nasi hihi",
    price: 20000,
    stock: 10,
  ),
  const Product(
    id: 3,
    picturePath:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
    name: 'Sate Sayur Sultan',
    description:
        "Bosan dengan sate ayam madura, kini aku coba membuat sate ayam dengan saus spesial. Rasa asam dari jeruk limau, pedas dari cabe rawit membuat saus ini sangat menyegarkan. Dijamin tambah nasi hihi",
    price: 20000,
    stock: 10,
  ),
  const Product(
    id: 4,
    picturePath:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
    name: 'Sate Sayur Sultan',
    description:
        "Bosan dengan sate ayam madura, kini aku coba membuat sate ayam dengan saus spesial. Rasa asam dari jeruk limau, pedas dari cabe rawit membuat saus ini sangat menyegarkan. Dijamin tambah nasi hihi",
    price: 20000,
    stock: 20,
  ),
  const Product(
    id: 5,
    picturePath:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
    name: 'Sate Sayur Sultan',
    description:
        "Bosan dengan sate ayam madura, kini aku coba membuat sate ayam dengan saus spesial. Rasa asam dari jeruk limau, pedas dari cabe rawit membuat saus ini sangat menyegarkan. Dijamin tambah nasi hihi",
    price: 20000,
    stock: 15,
  )
];
