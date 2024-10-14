import 'dart:convert';

import 'package:api_handle/post_data.dart';
import 'package:http/http.dart' as http;


// class PostService {
//   final String url = "https://jsonplaceholder.typicode.com/posts";

//   Future<List<PostDataModel>> fetchPostData() async {
//     final responce = await http.get(
//       Uri.parse('$url'),
//     );
//     if (responce.statusCode == 200) {
//       final jsonData = json.decode(responce.body);
//       print("Raw JSON data posttttttttt: $jsonData");
//       List<PostDataModel> post = [];
//       if (jsonData.length != 0) {
//         try {
//           post = (jsonData as List)
//               .map((rpost) => PostDataModel.fromJson(rpost))
//               .toList();
//         } catch (e) {
//           print("exceptionn $e");
//         }
//       }

//       print("Parsed NewsModel tttttt: $post");

//       return post;
//     } else {
//       throw Exception('Failed to load posts yyyyyyyy');
//     }
//   }
// }
class PostService {
  final String url = "https://jsonplaceholder.typicode.com/posts";
  Future<List<PostDataModel>> fetchPostData() async {
    final response = await http.get(
      Uri.parse('$url'),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      print("Raw JSON data: $jsonData");
      var model = jsonData
          .map((json) => PostDataModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return model;
    } else {
      throw Exception("fialed to load post");
    }
  }
}
