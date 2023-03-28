part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Product>>> getFoods(
      {http.Client? client}) async {
    client ??= http.Client();
    String url = '${baseURL}food';
    var response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }

    var data = jsonDecode(response.body);

    List<Product> foods = (data['data']['data'] as Iterable)
        .map((e) => Product.fromJson(e))
        .toList();

    return ApiReturnValue(value: foods);
  }
}
