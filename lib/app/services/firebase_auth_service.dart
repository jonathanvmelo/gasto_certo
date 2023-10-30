import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gasto_certo/app/data/models/user_model.dart';
import 'package:gasto_certo/app/services/auth_service.dart';

class FirebaseAuthService implements IAuthService {
  final _auth = FirebaseAuth.instance;
  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      // Verifica se o e-mail já está associado a uma conta existente no Firebase
      List<String> signInMethods =
          await _auth.fetchSignInMethodsForEmail(email);

      if (signInMethods.contains('password')) {
        // Se 'password' estiver presente em signInMethods, significa que o e-mail já está registrado
        final result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        log(result.user!.uid);

        if (result.user != null) {
          return UserModel(
            name: result.user!.displayName,
            email: result.user!.email,
            id: result.user!.uid,
          );
        } else {
          throw Exception('Usuário não encontrado');
        }
      } else {
        throw Exception('Usuário não cadastrado');
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Erro');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        result.user!.updateDisplayName(name);

        return UserModel(
            name: result.user!.displayName,
            email: result.user!.email!,
            id: result.user!.uid);
      } else {
        throw Exception('Usuário não cadastrado');
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      throw e.message ?? 'Erro';
    }
  }
}
