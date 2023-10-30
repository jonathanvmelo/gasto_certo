import "dart:developer";

import "package:flutter/material.dart";

import "package:flutter_pluggy_connect/flutter_pluggy_connect.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:gasto_certo/app/data/DTO/conection_key_response.dart";
import "package:gasto_certo/app/data/repositories/pluggy_repository.dart";

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final HomeController controller = HomeController(PluggyRepository());

  bool enterSucess = false;

  // ignore: unused_field
  // late Future<String> _futurePluggyConnectToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Repository.getConnectionToken(
            dotenv.env['CLIENT_ID'] ?? "", dotenv.env['CLIENT_SECRET'] ?? ""),
        builder: (BuildContext context,
            AsyncSnapshot<ConnectionKeyResponse?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else {
              return PluggyConnect(
                  includeSandbox: true,
                  onSuccess: (data) {
                    log('onSuccess: ');

                    enterSucess = true;
                  },
                  onClose: () {
                    log('onClose: ');

                    if (enterSucess) {
                      Navigator.of(context).pushNamed("/homeBottomBar");
                    } else {
                      //Navigator.of(context).pop();
                      Navigator.of(context).popAndPushNamed('signIn');
                    }
                  },
                  onError: (error) {
                    log('onError: ');
                  },
                  onOpen: () {
                    log('onOpen: ');

                    enterSucess = false;
                  },
                  onEvent: (payload) {
                    log('onEvent: ');
                  },
                  connectToken: snapshot.data!.connectionToken);
            }
          }
        },
      ),
    );
  }
}


//  connectToken:
//             'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJZCI6IjI1YzEwY2E5LTdjNWMtNGVhOC04OTcwLTk1ZmI4OWZlOWFkOCIsImRhdGEiOiI5OGI4OTY0YTExOTk2M2UzMDQ3NDc3MWM5MjlmZDBmZDplNzQ0MGQ4NTFjNDgwZWIyYzZhNWFjZDliZWY1M2VmZjQ5YjRmYzc4NjM2YzFiZGQzY2FlYjRmODZjZmRlMzE5OWI4MTEwYWY2OTk1MDNhNTMzNDg0OGFjN2QwNzFlNGUzZGU2MGYxOWQ4YjUyYTgxYjJjYzU5NjgyZjQ3MDEzOGY1ZWVjODM2OTJiODM4YWNhZTI2MDIzYjJmZjkzMTNjODk4YTZhZTI4MDZlZTYxNjllZWY4Njc0YTgxYjg1ZDY1NThhYmZiMmJmZTExNzhhZjk0YWY2MmI1YWY1ZGUxZmI5NzA5MTgyOTk1NTJhZDIxODFmNDE4MzU4NDc1YjlhIiwiaWF0IjoxNjk4MTA5OTA4LCJleHAiOjE2OTgxMTE3MDh9.jLGiWWVGq2KY42ayaswgJda8LQx8DL4hIonlmRWWfq0F_92YFGu_XMz06Mq79dIolylzkHjcNbvfLSe-vGHy5qAKZrPAfi8i9wk-RIt6alGCH5m-MFp1a3zlapwUve1s7GzGne89aVwl6Ajnh1zfIhm8Zr8kbakFZLhQh_Y0U3pJkkuGOJJYGPUSQsi4CJ3ZNIRl6H3H4JTgfGH9mhEb6oAjFZr59m1a73qnKBT11gXYzlsrCzVztD1QjIB8wKHaxAQMSOMkNCWxrX3GAuh5sWpwmDgyS-vTIdW8Ld7eDkxAQIJHpR6VVSbQjJFrnvhdrqH_KKPFHNGZTMLv9brSEQ',
//       )