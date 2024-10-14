import 'dart:convert';

import 'package:http/http.dart' as http;

import 'university_data_model.dart';

class ApiService {
  static const String apiUrl =
      "http://universities.hipolabs.com/search?country=United+States";

  Future<List<UniversityDataModel>> fetchUniversities() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => UniversityDataModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}

class UniversityServices {
  final String url =
      "http://universities.hipolabs.com/search?country=United+States";
  Future<List<UniversityDataModel>> fetchUniversityData() async {
    final responce = await http.get(Uri.parse("$url"));
    print(url);
    print(responce);

    if (responce.statusCode == 200) {
      List<dynamic> jsonData = json.decode(responce.body);
      print("data json format $jsonData");
      print(responce.body);
      var model = jsonData
          .map((json) =>
              UniversityDataModel.fromJson(json as Map<String, dynamic>))
          .toList();
      print("aaaaaaaaaaaaaaaaaaaaa $model");
      return model;
    } else {
      throw Exception("falied to load data");
    }
  }
}
