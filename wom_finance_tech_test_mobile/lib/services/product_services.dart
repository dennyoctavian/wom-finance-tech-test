part of 'services.dart';

class ProductServices {
  static Future<ApiReturnValue<List<Product>>> getProducts(
      {http.Client? client}) async {
    client ??= http.Client();
    String url = '${baseURL}products';
    var response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }

    var data = jsonDecode(response.body);
    print(data);

    List<Product> foods =
        (data['data'] as Iterable).map((e) => Product.fromJson(e)).toList();

    return ApiReturnValue(value: foods);
  }
}
