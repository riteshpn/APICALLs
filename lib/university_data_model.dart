class UniversityDataModel {
  String? stateProvince;
  String alphaTwoCode;
  List<String> webPages;
  String name;
  String country;
  List<String> domains;

  UniversityDataModel({
    this.stateProvince,
    required this.alphaTwoCode,
    required this.webPages,
    required this.name,
    required this.country,
    required this.domains,
  });

  factory UniversityDataModel.fromJson(Map<String, dynamic> json) {
    return UniversityDataModel(
      stateProvince: json['state-province'],
      alphaTwoCode: json['alpha_two_code'],
      webPages: List<String>.from(json['web_pages']),
      name: json['name'],
      country: json['country'],
      domains: List<String>.from(json['domains']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state-province': stateProvince,
      'alpha_two_code': alphaTwoCode,
      'web_pages': webPages,
      'name': name,
      'country': country,
      'domains': domains,
    };
  }
}
