class ConnectionKeyResponse {
  String connectionToken = "";
  ConnectionKeyResponse({
    required this.connectionToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'connectionToken': connectionToken,
    };
  }

  ConnectionKeyResponse.fromJson(Map<String, dynamic> json) {
    connectionToken = json['accessToken'];
  }
}
