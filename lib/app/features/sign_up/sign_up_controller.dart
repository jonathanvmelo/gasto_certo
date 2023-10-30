import 'package:flutter/material.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_state.dart';
import 'package:gasto_certo/app/services/auth_service.dart';

class SignUpController extends ChangeNotifier {
  final IAuthService _service;
  SignUpController(this._service);

  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _updateState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    _updateState(SignUpLoadingState());

    try {
      await _service.signUp(name: name, email: email, password: password);
      _updateState(SignUpSuccessState());
    } catch (e) {
      _updateState(SignUpErrorState(message: e.toString()));
    }
  }
}
