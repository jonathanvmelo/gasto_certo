// class PluggyConnectTokenResponse {
//   final String accessToken;

//   PluggyConnectTokenResponse({required this.accessToken});

//   factory PluggyConnectTokenResponse.fromJson(Map<String, dynamic> json) {
//     return PluggyConnectTokenResponse(
//       accessToken: json['accessToken'] as String,
//     );
//   }
// }

import 'dart:convert';

class ClientPluggyResponse {
  String apiKey = "";
  ClientPluggyResponse({
    required this.apiKey,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiKey': apiKey,
    };
  }

  factory ClientPluggyResponse.fromMap(Map<String, dynamic> map) {
    return ClientPluggyResponse(
      apiKey: map['apiKey'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientPluggyResponse.fromJson(String source) =>
      ClientPluggyResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
