// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gasto_certo/app/features/sign_in/sign_in_state.dart';
import 'package:gasto_certo/app/services/auth_service.dart';
import 'package:gasto_certo/app/services/secury_storage.dart';

class SignInController extends ChangeNotifier {
  final IAuthService _service;
  final secure = const SecureStorage();

  SignInController(
    this._service,
  );

  ISignInState state = SignInStateInitial();

  void _changeState(ISignInState newState) {
    state = newState;
    notifyListeners();
  }

  Future<bool> signIn({required String email, required String password}) async {
    _changeState(SignInStateLoading());

    try {
      final user = await _service.signIn(email: email, password: password);
      if (user.id != null) {
        secure.write(key: "CURRENT_USER", value: user.toJson());
        _changeState(SignInStateSuccess());
      } else {
        throw Exception();
      }
      return true;
    } catch (e) {
      _changeState(SignInStateError(message: e.toString()));
      return false;
    }
  }

  isUserLogged() async {
    var result = await secure.readOne(key: "CURRENT_USER");
    if (result != null) {
      _changeState(SignInStateSuccess());
    } else {
      _changeState(SignInStateError());
    }
  }
}
