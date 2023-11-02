import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/features/splash/splash_state.dart';
import 'package:gasto_certo/app/services/secury_storage.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _secureStorage;

  ISplashState _state = SplashStateInitial();

  SplashController(this._secureStorage);

  ISplashState get state => _state;

  void updateState(ISplashState newState) {
    _state = newState;
    notifyListeners();
  }

  isUserLogged() async {
    final result = await _secureStorage.readOne(key: "CURRENT_USER");

    // ignore: unnecessary_null_comparison
    if (result != null) {
      log(result);
      updateState(SplashStateSuccess());
    } else {
      updateState(SplashStateError());
    }
  }
}
