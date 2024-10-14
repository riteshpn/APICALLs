import 'package:api_handle/news_domain_model.dart';
import 'package:api_handle/news_service.dart';
import 'package:api_handle/post_data.dart';
import 'package:api_handle/post_domain.dart';
import 'package:api_handle/post_service.dart';
import 'package:api_handle/university_data_model.dart';
import 'package:api_handle/university_domain_model.dart';
import 'package:api_handle/university_services.dart';
import 'package:api_handle/user_data_model.dart';
import 'package:api_handle/user_domain_model.dart';
import 'package:api_handle/user_service.dart';
import 'package:flutter/material.dart';

// class NewsViewModel {
//   String title = "News HeadLine";
//   List<NewsDomainModel> newsData = [
//     NewsDomainModel("Ind vs Pak", "Ind won by 1 run .. and man of the match ",
//         "Dhoni man of the series"),
//     NewsDomainModel("Ind vs Pak", "Ind won by 1 run .. and man of the match ",
//         "Dhoni man of the series"),
//     NewsDomainModel("Ind vs Pak", "Ind won by 1 run .. and man of the match ",
//         "Dhoni man of the series")
//   ];

// void fetchNews() async {
//   final newsService = NewsService();
//   try {
//     final news = await newsService.fetchNews();
//     List<NewsDomainModel> newsList = [];
//     for (int i = 0; i < (news.articles?.length ?? 0); i++) {
//       var artitle = news.articles?[i];
//       var newsModel = NewsDomainModel(artitle?.title ?? "",
//           artitle?.description ?? "", artitle?.author ?? "");

//       newsList.add(newsModel);
//     }

//     newsData = newsList;

//     print("Final NewsModel returned: $news");
//   } catch (error) {
//     print('Error: $error');
//   }
// }
// }
// class NewsViewModelProvider with ChangeNotifier {
//   String title = "News HeadLine";
//   List<NewsDomainModel> _newsData = [];
//   bool _isFetching = false;

//   List<NewsDomainModel> get newsData => _newsData;

//   Future<void> fetchNews() async {
//     if (_isFetching) return;

//     _isFetching = true;
//     final newsService = NewsService();
//     try {
//       final news = await newsService.fetchNews();
//       List<NewsDomainModel> newsList = [];
//       for (var article in news.articles ?? []) {
//         var newsModel = NewsDomainModel(
//           article.title ?? "",
//           article.description ?? "",
//           article.author ?? "",
//         );
//         newsList.add(newsModel);
//       }

//       _newsData = newsList;
//       notifyListeners();
//     } catch (error) {
//       print('Error fetching news: $error');
//     } finally {
//       _isFetching = false;
//     }
//   }
// }
class NewsViewModelProvider extends ChangeNotifier {
  String title = "News Headline";
  List<NewsDomainModel> _newsData = [
    NewsDomainModel("Ind vs Pak", "Ind won by 1 run .. and man of the match ",
        "Dhoni man of the series"),
    NewsDomainModel("Ind vs Pak", "Ind won by 1 run .. and man of the match ",
        "Dhoni man of the series"),
    NewsDomainModel("Ind vs Pak", "Ind won by 1 run .. and man of the match ",
        "Dhoni man of the series")
  ];
  List<NewsDomainModel> get newsData => _newsData;
  NewsViewModelProvider() {
    _initialize();
  }
  void _initialize() async {
    await fetchNews();
    await fetchPostData();
    await fetchUserData();
    await fetchUniversityData();
  }

  Future<void> fetchNews() async {
    notifyListeners();

    final newsService = NewsService();

    try {
      final news = await newsService.fetchNews();
      List<NewsDomainModel> newsList = [];
      for (var article in news.articles ?? []) {
        var newsModel = NewsDomainModel(
          article.title ?? "",
          article.description ?? "",
          article.author ?? "",
        );
        newsList.add(newsModel);
      }
      _newsData = newsList;
      notifyListeners();
    } catch (error) {
      print('Error fetching news: $error');
    } finally {
      notifyListeners();
    }
  }

// for post
  String heading = "User Post";
  List<PostDomainModel> _postData = [
    PostDomainModel(
        title: "First User", description: "heie eheh hehh eheheheh"),
    PostDomainModel(
        title: "First User", description: "heie eheh hehh eheheheh"),
    PostDomainModel(
        title: "First User", description: "heie eheh hehh eheheheh"),
    PostDomainModel(
        title: "First User", description: "heie eheh hehh eheheheh"),
  ];
  List<PostDomainModel> get postData => _postData;

  Future<void> fetchPostData() async {
    notifyListeners();
    final postService = PostService();
    try {
      List<PostDataModel> postDataList = await postService.fetchPostData();
      List<PostDomainModel> postList = [];
      for (int i = 0; i < postDataList.length; i++) {
        var post = postDataList[i];
        var postDomainModel =
            PostDomainModel(title: post.title, description: post.body);
        postList.add(postDomainModel);
      }
      _postData = postList;
      print(postData);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

// upper part
  List<UserDomainModel> _userData = [
    UserDomainModel(id: 1, name: "ritesh", username: "rpn@mail"),
    UserDomainModel(id: 1, name: "ritesh", username: "rpn@mail"),
    UserDomainModel(id: 1, name: "ritesh", username: "rpn@mail"),
    UserDomainModel(id: 1, name: "ritesh", username: "rpn@mail"),
    UserDomainModel(id: 1, name: "ritesh", username: "rpn@mail"),
    UserDomainModel(id: 1, name: "ritesh", username: "rpn@mail")
  ];
  List<UserDomainModel> get userData => _userData;
  Future<void> fetchUserData() async {
    notifyListeners();
    final userService = UserService();
    try {
      List<UserDataModel> userDataList = await userService.fetchUserData();
      List<UserDomainModel> userList = [];
      for (int i = 0; i < userDataList.length; i++) {
        var user = userDataList[i];
        var userDomainList =
            UserDomainModel(id: user.id, name: user.name, username: user.email);
        userList.add(userDomainList);
      }

      _userData = userList;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

// unniversity data
  List<UniversityDomainModel> _universityData = [
    UniversityDomainModel(
        name: "ritesh", country: "India", webPages: ["wwww.htt"]),
    UniversityDomainModel(
        name: "ritesh", country: "India", webPages: ["wwww.htt"]),
    UniversityDomainModel(
        name: "ritesh", country: "India", webPages: ["wwww.htt"]),
    UniversityDomainModel(
        name: "ritesh", country: "India", webPages: ["wwww.htt"]),
  ];
  List<UniversityDomainModel> get universityData => _universityData;
  Future<void> fetchUniversityData() async {
    notifyListeners();
    final universityServices = UniversityServices();
    try {
      List<UniversityDataModel> universityDataList =
          await universityServices.fetchUniversityData();
      List<UniversityDomainModel> universityList = [];
      for (var i = 0; i < universityDataList.length; i++) {
        var university = universityDataList[i];
        print(university);
        var universityDomainList = UniversityDomainModel(
            name: university.name,
            country: university.country,
            webPages: university.webPages);
        universityList.add(universityDomainList);
        _universityData = universityList;
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }
}
