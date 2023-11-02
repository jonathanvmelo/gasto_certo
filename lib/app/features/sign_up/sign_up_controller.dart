import 'package:flutter/material.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_state.dart';
import 'package:gasto_certo/app/services/auth_service.dart';
import 'package:gasto_certo/app/services/secury_storage.dart';

class SignUpController extends ChangeNotifier {
  final IAuthService _service;
  SignUpController(this._service);

  ISignUpState _state = SignUpInitialState();

  ISignUpState get state => _state;

  void _updateState(ISignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> doSignUp(
      {required String name,
      required String email,
      required String password}) async {
    const secureStorage = SecureStorage();

    _updateState(SignUpLoadingState());

    try {
      final user =
          await _service.signUp(name: name, email: email, password: password);
      if (user.id != null) {
        await secureStorage.write(key: 'CURRENT_USER', value: user.toJson());
        _updateState(SignUpSuccessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _updateState(SignUpErrorState(message: e.toString()));
    }
  }
}
