import 'dart:convert';
import 'package:fluttermachinetest/Services/Auth-API-Service/Auth-API-Constant.dart';
import 'package:http/http.dart' as http;

class AuthAPIs {

  static Future<Map<String, dynamic>> registerUser(
    String name,
    String email,
    String password,
  ) async {
    try {
      const String url = "${AuthAPIConstant.baseURL}register";

      final uriParse = Uri.parse(url);

      final response = await http.post(
        uriParse,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": name,
          "email": email,
          "password": password,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return data;
      } else {
        return {'message': data['message'] ?? 'Something went wrong'};
      }
    } catch (e) {
      print("Error: $e");
      return {'message': 'Error: ${e.toString()}'};
    }
  }

  static Future<Map<String, dynamic>> loginUser(
    String email,
    String password,
  ) async {
    try {
      const String url = "${AuthAPIConstant.baseURL}login";

      final uriParse = Uri.parse(url);

      final response = await http.post(
        uriParse,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return data;
      } else {
        return {'message': data['message'] ?? 'Something went wrong'};
      }
    } catch (e) {
      print("Error: $e");
      return {'message': 'Error: ${e.toString()}'};
    }
  }

  static Future<Map<String, dynamic>> sendOTP(String email) async {
    try {
      const String url = "${AuthAPIConstant.baseURL}send-otp";

      final uriParse = Uri.parse(url);

      final response = await http.post(
        uriParse,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return data;
      } else {
        return {'message': data['message'] ?? 'Something went wrong'};
      }
    } catch (e) {
      print("Error: $e");
      return {'message': 'Error: ${e.toString()}'};
    }
  }

  static Future<Map<String, dynamic>> verifyOTP(
    String email,
    String otp,
  ) async {
    try {
      const String url = "${AuthAPIConstant.baseURL}verify-otp";

      final uriParse = Uri.parse(url);

      final response = await http.post(
        uriParse,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'otp': otp}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return data;
      } else {
        return {'message': data['message'] ?? 'Something went wrong'};
      }
    } catch (e) {
      print("Error: $e");
      return {'message': 'Error: ${e.toString()}'};
    }
  }



}
