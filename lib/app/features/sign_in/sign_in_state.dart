// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ISignInState {}

class SignInStateInitial extends ISignInState {}

class SignInStateLoading extends ISignInState {}

class SignInStateProfile extends ISignInState {}

class SignInStateError extends ISignInState {
  String? message;
  SignInStateError({
    this.message,
  });
}

class SignInStateSuccess extends ISignInState {}
