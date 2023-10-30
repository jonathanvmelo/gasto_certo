// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:gasto_certo/app/features/home/repositories/home_repository.dart';

class HomeController {
  // Classe que depende de IHomeRepository

  final IHomeRepository homeRepository;

  HomeController(this.homeRepository);

  Future<String> getPluggyConnectToken() {
    return homeRepository.fetchPluggyConnectToken();
  }
}
