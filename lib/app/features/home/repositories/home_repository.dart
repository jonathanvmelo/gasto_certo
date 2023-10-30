abstract class IHomeRepository {
  Future<String> fetchPluggyConnectToken();
}

// class HomeRepository implements IHomeRepository {
//   @override
//   Future<String> fetchPluggyConnectToken() async {
//     // final response = await http
//     //     .get(Uri.parse('https://pluggy-connect.vercel.app/api/token'));

//     // if (response.statusCode == 200) {
//     //   ClientPluggyResponse tokenResponse =
//     //       ClientPluggyResponse.fromJson(jsonDecode(response.body));
//     //   return tokenResponse.apiKey;
//     // } else {
//     //   throw Exception('Erro. Não foi possívivel obter seu Token de acesso');
//     // }
//     return '';
//   }
// }
