import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wom_finance_tech_test_mobile/models/models.dart';
import 'package:http/http.dart' as http;

part 'product_services.dart';
part 'user_services.dart';
part 'transaction_services.dart';

String baseURL = "http://10.0.2.2:8000/api/";
