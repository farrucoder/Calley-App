import 'dart:convert';

import 'package:fluttermachinetest/Services/Call-List-API-Service/Call-List-Constant.dart';
import 'package:fluttermachinetest/Utils/User-Preference-Data.dart';
import 'package:http/http.dart' as http;

class CallListAPI{


  static Future<Map<String, dynamic>> callList() async {
    try {

      final userId = await UserPreferencesData.getUserId();

      final String url = "${CallListAPIConstant.baseURL}$userId";

      final uriParse = Uri.parse(url);

      final response = await http.get(
        uriParse,
        headers: {'Content-Type': 'application/json'},
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


  static Future<Map<String, dynamic>> callListDetails() async {
    try {

      final callId = await UserPreferencesData.getCallId();

      print(callId);
      final String url = "${CallListAPIConstant.callListBaseURL}$callId";

      final uriParse = Uri.parse(url);

      final response = await http.get(
        uriParse,
        headers: {'Content-Type': 'application/json'},
      );

      final data = jsonDecode(response.body);

      print(data['pending']);
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