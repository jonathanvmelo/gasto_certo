// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gasto_certo/app/features/sign_in/sign_in_state.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_event.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_state.dart';
import 'package:gasto_certo/app/services/auth_service.dart';
import 'package:gasto_certo/app/services/google_auth_service.dart';

class SignUpBloc {
  final googleService = GoogleAuthService();
  final StreamController<SignUpEvent> _getUserWithGoogle = StreamController();

  final StreamController<ISignUpState> _outPutUser = StreamController();

  Sink<SignUpEvent> get getUser => _getUserWithGoogle.sink;

  Stream<ISignUpState> get outputUser => _outPutUser.stream;

  SignUpBloc() {
    _getUserWithGoogle.stream.listen(_mapEventToState);
  }

  _mapEventToState(SignUpEvent event) async {
    User? user;
    _outPutUser.add(SignUpLoadingState());
    if (event is GetUser) {
      user = await googleService.signInWithGoogle();
    }
    _outPutUser.add(SignUpSuccessState(user: user));
  }
}
