import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? id;
  String? userId;
  String? name;
  String? email;
  String? password;
  UserModel({
    this.id,
    this.userId,
    this.password,
    this.email,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? '';
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
