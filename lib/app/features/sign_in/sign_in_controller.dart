// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gasto_certo/app/features/sign_in/sign_in_state.dart';
import 'package:gasto_certo/app/services/auth_service.dart';

class SignInController extends ChangeNotifier {
  final IAuthService _service;
  SignInController(
    this._service,
  );

  SignInState state = SignInStateInitial();

  void _changeState(SignInState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> signIn({required String email, required String password}) async {
    _changeState(SignInStateLoading());

    try {
      await _service.signIn(email: email, password: password);
      _changeState(SignInStateSuccess());
    } catch (e) {
      _changeState(SignInStateError(message: e.toString()));
    }
  }
}
