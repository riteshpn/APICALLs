import 'package:api_handle/custom_size.dart';
import 'package:api_handle/enum_class.dart';
import 'package:api_handle/photo_screen.dart';
import 'package:api_handle/view_model_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreenList extends StatelessWidget {
  NewsScreenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade100,
      body: Consumer<NewsViewModelProvider>(
        builder: (context, newsViewModel, child) {
          if (newsViewModel.newsData.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: newsViewModel.userData.length,
                    itemBuilder: (context, index) {
                      final users = newsViewModel.userData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Container(
                          height: 85,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                users.name,
                                style: TextStyle(color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                users.username,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 8),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: newsViewModel.newsData.length,
                          itemBuilder: (context, index) {
                            final news = newsViewModel.newsData[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              child: Card(
                                color: Colors.black,
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(16.0),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          news.title,
                                          style: TextStyle(
                                            fontWeight: TextStyleType
                                                .titleStyle.getFontWeight,
                                            fontSize: TextStyleType
                                                .titleStyle.getFontsize,
                                            color: TextStyleType
                                                .titleStyle.getFontcolor,
                                          ),
                                        ),
                                      ),
                                      const CustomSizedBox.h8(),
                                      Text(
                                        news.subtitle,
                                        style: TextStyle(
                                          fontWeight: TextStyleType
                                              .subtitleStyle.getFontWeight,
                                          fontSize: TextStyleType
                                              .subtitleStyle.getFontsize,
                                          color: TextStyleType
                                              .subtitleStyle.getFontcolor,
                                        ),
                                      ),
                                      const CustomSizedBox.h4(),
                                      Text(
                                        news.description,
                                        style: TextStyle(
                                          fontWeight: TextStyleType
                                              .descriptionStyle.getFontWeight,
                                          fontSize: TextStyleType
                                              .descriptionStyle.getFontsize,
                                          color: TextStyleType
                                              .descriptionStyle.getFontcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Provider.of<NewsViewModelProvider>(context).heading,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: newsViewModel.postData.length,
                          itemBuilder: (context, index) {
                            final posts = newsViewModel.postData[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              child: Card(
                                color: Colors.black,
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(16.0),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          posts.title,
                                          style: TextStyle(
                                            fontWeight: TextStyleType
                                                .postTitleStyle.getFontWeight,
                                            fontSize: TextStyleType
                                                .postTitleStyle.getFontsize,
                                            color: TextStyleType
                                                .postTitleStyle.getFontcolor,
                                          ),
                                        ),
                                      ),
                                      const CustomSizedBox.h8(),
                                      Text(
                                        posts.description,
                                        style: TextStyle(
                                          fontWeight: TextStyleType
                                              .postdescriptionStyle
                                              .getFontWeight,
                                          fontSize: TextStyleType
                                              .postdescriptionStyle.getFontsize,
                                          color: TextStyleType
                                              .postdescriptionStyle
                                              .getFontcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newsViewModel.universityData.length,
                          itemBuilder: (context, index) {
                            final university =
                                newsViewModel.universityData[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5),
                              child: Container(
                                height: 85,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      university.name,
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      university.country,
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 8),
                                      textAlign: TextAlign.center,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => WebViewScreen(
                                                url: university.webPages[0]),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        university.webPages.toString(),
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 8),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
