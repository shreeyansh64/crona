import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crona/models/registermodel.dart';

class RegisterService {
  final String baseUrl = 'https://cronaweb.me/api/auth/register';

  Future<RegisterModel> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse(baseUrl);

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Cookie':
              'accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2OGVmY2JjMTU2NjdhNDM2NmQwYTY2NzciLCJlbWFpbCI6InpldXNAZ21haWwuY29tIiwiZnVsbE5hbWUiOiJVc2VyIiwiaWF0IjoxNzYwNTQ1NzI5LCJleHAiOjE3NjA1NDYzMjl9.N11sXAq3aH1miY-N3asZ53DERBe2mJ4mHWrWKWZeKiU; refreshToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2OGVmY2JjMTU2NjdhNDM2NmQwYTY2NzciLCJpYXQiOjE3NjA1NDU3MjksImV4cCI6MTc2MTQwOTcyOX0.3G-xTN_FKiZbA7xRSlzw7kee0NGRslUIU1l_I7_8JOw',
        },
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return RegisterModel.fromJson(json);
      } else {
        throw Exception('Failed to register: ${response.body}');
      }
    } catch (e) {
      throw Exception('RegisterService Error: $e');
    }
  }
}
