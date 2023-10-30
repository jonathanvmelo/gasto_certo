// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInState {}

class SignInStateInitial extends SignInState {}

class SignInStateLoading extends SignInState {}

class SignInStateError extends SignInState {
  String? message;
  SignInStateError({
    this.message,
  });
}

class SignInStateSuccess extends SignInState {}
