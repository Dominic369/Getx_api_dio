import 'dart:convert';

List<ApiDataModel> welcomeFromJson(String str) => List<ApiDataModel>.from(
    json.decode(str).map((x) => ApiDataModel.fromJson(x)));

String welcomeToJson(List<ApiDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiDataModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;

  ApiDataModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  factory ApiDataModel.fromJson(Map<String, dynamic> json) => ApiDataModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "website": website,
      };

  /*
  ApiDataModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;

  factory ApiDataModel.fromJson(Map<String, dynamic> json) => ApiDataModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
      );
      */
}
