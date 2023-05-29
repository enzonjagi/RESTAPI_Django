import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rest_api_consumption/constants.dart';
import 'package:rest_api_consumption/user_model.dart';


class ApiService {
  // Handles the API Calls
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseurl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}