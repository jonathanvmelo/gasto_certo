import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  Future<User?> signInWithGoogle() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication authentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: authentication.accessToken,
            idToken: authentication.idToken);

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          if (userCredential.user != null) {
            log('logado com Google');
            return userCredential.user;
          } else {
            log('Erro ao logar');
            return null;
          }
        } on FirebaseAuthException catch (e) {
          log(e.toString());
        } catch (ex) {
          log(ex.toString());
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exist-with-different-credential') {}
    } catch (e) {
      log(e.toString());
    }
  }
}
