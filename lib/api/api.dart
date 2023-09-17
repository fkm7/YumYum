import 'package:dio/dio.dart';

class ApiService {
  ApiService._privateConstructor();

  static final _instance = ApiService._privateConstructor();

  final apiUrl = 'http://192.168.0.11:8080/api/v1';

  static ApiService getInstance() => _instance;

  final client = Dio();

  Future<bool> auth(String phone) async {
    final response = await client.get('$apiUrl/auth/$phone');
    return response.statusCode == 200;
  }
}
