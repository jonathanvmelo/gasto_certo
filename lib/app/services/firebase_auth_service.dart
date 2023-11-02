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
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        return UserModel(
            name: result.user!.displayName,
            email: result.user!.email!,
            id: result.user!.uid);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {}
      log('ONLY e ${e.toString()}');
      log('CODE ${e.code.toString()}');
      log('MESSAGE${e.message.toString()}');
      throw e.message ?? 'Erro';
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
            name: _auth.currentUser?.displayName,
            email: result.user!.email!,
            id: result.user!.uid);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      // if (e.message == 'INVALID_LOGIN_CREDENTIALS') {
      log('código ${e.code.toString()}');
      log('${e.message.toString()}');
      throw e.message ?? 'Erro';
      // }
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
