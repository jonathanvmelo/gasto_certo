import 'package:gasto_certo/app/data/models/user_model.dart';

abstract class IAuthService {
  Future<UserModel> signUp(
      {String? name, required String email, required String password});

  Future<UserModel> signIn({
    required String email,
    required String password,
  });
}
