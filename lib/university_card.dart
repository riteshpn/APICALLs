import 'package:flutter/material.dart';

import 'university_data_model.dart';

class UniversityCard extends StatelessWidget {
  final UniversityDataModel university;

  UniversityCard({required this.university});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              university.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Country: ${university.country} (${university.alphaTwoCode})"),
            if (university.stateProvince != null)
              Text("State/Province: ${university.stateProvince}"),
            SizedBox(height: 8),
            Text("Domains:", style: TextStyle(fontWeight: FontWeight.bold)),
            for (var domain in university.domains) Text(domain),
            SizedBox(height: 8),
            Text("Web Pages:", style: TextStyle(fontWeight: FontWeight.bold)),
            for (var webPage in university.webPages)
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => WebViewPage(url: webPage),
                  //   ),
                  // );
                },
                child: Text(
                  webPage,
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
