import 'package:gasto_certo/app/data/models/user_model.dart';
import 'package:gasto_certo/app/services/auth_service.dart';

class MockAuthService implements IAuthService {
  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(id: email.hashCode.toString(), email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura, Crie uma senha decente!';
      }

      throw 'Não foi possível criar sua senha. Tente novamente';
    }
  }

  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      return UserModel(
          id: email.hashCode.toString(), name: name!, email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura, Crie uma senha decente!';
      }

      throw 'Não foi possível criar sua senha. Tente novamente';
    }
  }
}
