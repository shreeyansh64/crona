import 'package:dio/dio.dart';
import 'package:crona/models/loginmodel.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://cronaweb.me/api/auth',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<LoginResponse?> login(String emailOrPhoneOrUsername, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'emailOrPhoneOrUsername': emailOrPhoneOrUsername,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        print('Login failed: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      print('Login error: ${e.response?.data ?? e.message}');
      return null;
    }
  }
}
