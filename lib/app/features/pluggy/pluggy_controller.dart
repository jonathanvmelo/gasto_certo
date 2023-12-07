// ignore_for_file: public_member_api_docs, sort_constructors_first

// class HomeController {
//   // Classe que depende de IHomeRepository

//   final IHomeRepository homeRepository;

//   HomeController(this.homeRepository);

//   Future<String> getPluggyConnectToken() {
//     return homeRepository.fetchPluggyConnectToken();
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:gasto_certo/app/features/pluggy/pluggy_state.dart';

class PluggyController extends ChangeNotifier {
  IPluggyState state = PluggyStateInitial();

  // ignore: unused_element
  void _changeState(IPluggyState newState) {
    state = newState;
    notifyListeners();
  }
}
