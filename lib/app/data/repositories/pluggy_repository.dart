import 'dart:convert';
import 'dart:developer';

import 'package:gasto_certo/app/data/DTO/client_pluggy_request.dart';
import 'package:gasto_certo/app/data/DTO/client_pluggy_response.dart';
import 'package:gasto_certo/app/data/DTO/conection_key_request.dart';
import 'package:gasto_certo/app/data/DTO/conection_key_response.dart';
import 'package:http/http.dart' as http;

class PluggyRepository {
  Future<String> fetchPluggyConnectToken() async {
    final response = await http
        .get(Uri.parse('https://pluggy-connect.vercel.app/api/token'));

    if (response.statusCode == 200) {
      ClientPluggyResponse tokenResponse =
          ClientPluggyResponse.fromJson(jsonDecode(response.body));
      return tokenResponse.apiKey;
    } else {
      throw Exception('Erro. Não foi possívivel obter seu Token de acesso');
    }
  }

  // Future<String> getAccessToken() {}
}

// class Repository {
//   static Future<ClientPluggyResponse?> getToken(
//       String client, String secret) async {
//     ClientPluggyRequest request =
//         ClientPluggyRequest(clientId: client, clientSecret: secret);
//     final response = await http.post(Uri.parse('https://api.pluggy.ai/auth'),
//         body: request.toMap());
//     log(response.statusCode.toString());

//     if (response.statusCode == 200) {
//       var resposeObj = await jsonDecode(response.body);
//       return ClientPluggyResponse.fromMap(resposeObj);
//     }
//     return null;
//   }

//   static Future<ConnectionKeyResponse?> getConnectionToken(
//       String client, String secret) async {
//     ClientPluggyResponse? token = await Repository.getToken(client, secret);

//     final response = await http.post(
//         Uri.parse('https://api.pluggy.ai/connect_token'),
//         headers: {"X-API-KEY": token!.apiKey},
//         body: ConnectionKeyRequest(clientUserId: client).toMap());

//     if (response.statusCode == 200) {
//       var responseObj = await jsonDecode(response.body);
//       return ConnectionKeyResponse.fromJson(responseObj);
//     }

//     return null;
//   }
// }

class Repository {
  static Future<ClientPluggyResponse?> getToken(
      String client, String secret) async {
    ClientPluggyRequest request =
        ClientPluggyRequest(clientId: client, clientSecret: secret);
    final response = await http.post(Uri.parse('https://api.pluggy.ai/auth'),
        body: request.toMap());
    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      var resposeObj = await jsonDecode(response.body);
      return ClientPluggyResponse.fromMap(resposeObj);
    }
    return null;
  }

  static Future<ConnectionKeyResponse?> getConnectionToken(
      String client, String secret) async {
    ClientPluggyResponse? token = await Repository.getToken(client, secret);

    final response = await http.post(
        Uri.parse('https://api.pluggy.ai/connect_token'),
        headers: {"X-API-KEY": token!.apiKey},
        body: ConnectionKeyRequest(clientUserId: client).toMap());

    if (response.statusCode == 200) {
      var responseObj = await jsonDecode(response.body);
      return ConnectionKeyResponse.fromJson(responseObj);
    }

    return null;
  }
}
