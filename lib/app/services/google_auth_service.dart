import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/widgets/custom_snack_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  // ignore: body_might_complete_normally_nullable
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

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}
