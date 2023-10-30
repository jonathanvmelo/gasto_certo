import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// class ClientPluggyModel {
//   String clientId = "";
//   String clientSecret = "";

//   ClientPluggyModel({
//     required this.clientId,
//     required this.clientSecret,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'clientId': clientId,
//       'clientSecret': clientSecret,
//     };
//   }

//   ClientPluggyModel.fromJson(Map<String, dynamic> map) {
//     clientId = map['clientId'];
//     clientSecret = map['clientSecret'];
//   }

//   String toJson() => json.encode(toMap());

// }

class ClientPluggyRequest {
  String clientId = "";
  String clientSecret = "";
  //final String accessToken;

  ClientPluggyRequest({
    required this.clientId,
    required this.clientSecret,
  });

  ClientPluggyRequest.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    clientSecret = json['accessToken'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientId': clientId,
      'clientSecret': clientSecret,
    };
  }

  factory ClientPluggyRequest.fromMap(Map<String, dynamic> map) {
    return ClientPluggyRequest(
      clientId: map['clientId'] as String,
      clientSecret: map['clientSecret'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
