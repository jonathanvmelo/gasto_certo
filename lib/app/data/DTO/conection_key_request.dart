// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ConnectionKeyRequest {
  String clientUserId = "";

  ConnectionKeyRequest({
    required this.clientUserId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientUserId': clientUserId,
    };
  }

  ConnectionKeyRequest.fromJson(Map<String, dynamic> map) {
    clientUserId = map['clientUserId'] ?? "";
  }

  String toJson() => json.encode(toMap());
}
