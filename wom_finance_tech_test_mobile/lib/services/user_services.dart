part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> getUser({http.Client? client}) async {
    client ??= http.Client();
    final token = await UserServices.getToken();
    String url = '${baseURL}user';
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

    var user = User.fromJson(data['user']);

    return ApiReturnValue(value: user);
  }

  static Future<ApiReturnValue<void>> register(String name, String email,
      String password, String confirmPassword, String pictureUrl,
      {http.Client? client}) async {
    client ??= http.Client();
    String url = '${baseURL}register';
    final response = await client.post(
      Uri.parse(
        url,
      ),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        "name": name,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "picture_path": pictureUrl,
        // ignore: todo
        // TODO menggunakan geolocator
        "address":
            "Jl. Karang Anyar A No.39, RT.16/RW.6, Karang Anyar, Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10740"
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: jsonDecode(response.body)['message']);
    }
    var data = jsonDecode(response.body);
    UserServices.storeCredentialToLocal(data['token']);
    return ApiReturnValue();
  }

  static Future<ApiReturnValue<void>> login(String email, String password,
      {http.Client? client}) async {
    client ??= http.Client();
    String url = '${baseURL}login';
    final response = await client.post(
      Uri.parse(
        url,
      ),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: jsonDecode(response.body)['message']);
    }
    var data = jsonDecode(response.body);
    UserServices.storeCredentialToLocal(data['token']);
    return ApiReturnValue();
  }

  static Future<ApiReturnValue<void>> logout({http.Client? client}) async {
    client ??= http.Client();
    final token = await UserServices.getToken();
    String url = '${baseURL}logout';
    final response = await client.post(
      Uri.parse(
        url,
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: jsonDecode(response.body)['message']);
    } else {
      await clearLocalStorage();
      return ApiReturnValue();
    }
  }

  static Future<void> storeCredentialToLocal(String token) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token);
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = value;
    }

    return token;
  }

  static Future<void> clearLocalStorage() async {
    try {
      const storage = FlutterSecureStorage();
      await storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }
}
