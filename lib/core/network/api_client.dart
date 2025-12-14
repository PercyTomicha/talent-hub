import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final Dio dio;
  ApiClient() : dio = Dio(BaseOptions(baseUrl: dotenv.get('BASE_URL')));
}
