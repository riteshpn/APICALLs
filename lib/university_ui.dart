import 'package:api_handle/university_services.dart';
import 'package:flutter/material.dart';

import 'university_data_model.dart';
import 'university_card.dart';

class UniversityListScreen extends StatefulWidget {
  @override
  _UniversityListScreenState createState() => _UniversityListScreenState();
}

class _UniversityListScreenState extends State<UniversityListScreen> {
  List<UniversityDataModel> universities = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchUniversityData();
  }

  Future<void> fetchUniversityData() async {
    try {
      List<UniversityDataModel> fetchedUniversities =
          await ApiService().fetchUniversities();
      setState(() {
        universities = fetchedUniversities;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("University List")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(child: Text("Failed to load data"))
              : ListView.builder(
                  itemCount: universities.length,
                  itemBuilder: (context, index) {
                    return UniversityCard(university: universities[index]);
                  },
                ),
    );
  }
}
