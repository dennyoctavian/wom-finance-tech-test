part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransaction(
      {http.Client? client}) async {
    client ??= http.Client();
    final token = await UserServices.getToken();
    String url = '${baseURL}transactions';
    var response = await client.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }

    var data = jsonDecode(response.body);

    List<Transaction> transactions =
        (data['data'] as List).map((e) => Transaction.fromJson(e)).toList();

    return ApiReturnValue(value: transactions);
  }

  static Future<ApiReturnValue<Transaction>> makeTransaction(
      List<Product> transactionRequest,
      {http.Client? client}) async {
    final token = await UserServices.getToken();
    client ??= http.Client();
    String url = '${baseURL}transaction/create';

    List<Map<String, dynamic>> bodyResponse =
        transactionRequest.map((v) => v.toJson()).toList();

    final response = await client.post(
        Uri.parse(
          url,
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "products": bodyResponse,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: jsonDecode(response.body)['message']);
    }
    var data = jsonDecode(response.body);
    Transaction transaction = Transaction.fromJson(data['data']);

    return ApiReturnValue(value: transaction);
  }
}
