import 'dart:convert';

import 'package:api_handle/user_data_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserDataModel>> fetchUserData() async {
    final response = await http.get(
      Uri.parse("$url"),
    );
    print(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      print(jsonData);
      var model = jsonData
          .map((json) => UserDataModel.fromJson(json as Map<String, dynamic>),)
          .toList();
      print(model);
      return model;
    } else {
      throw Exception("failed to load post");
    }
  }
}
