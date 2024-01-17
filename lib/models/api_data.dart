import 'dart:convert';

// ignore: non_constant_identifier_names
List<User> UserFromjson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
}
