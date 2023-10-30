// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String message;
  SignUpErrorState({
    required this.message,
  });
}

class SignUpSuccessState extends SignUpState {}
