// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

abstract class ISignUpState {}

class SignUpInitialState extends ISignUpState {}

class SignUpLoadingState extends ISignUpState {}

class SignUpErrorState extends ISignUpState {
  final String message;
  SignUpErrorState({
    required this.message,
  });
}

class SignUpSuccessState extends ISignUpState {
  User? user;
  SignUpSuccessState({
    this.user,
  });
}
