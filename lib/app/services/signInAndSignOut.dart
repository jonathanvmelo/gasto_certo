import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

// Future<User> signInWithGoogle() async {
//   // Attempt to get the currently authenticated user
//   GoogleSignInAccount currentUser =   _googleSignIn.currentUser;
//   currentUser ??= await _googleSignIn.signInSilently();
//   currentUser ??= await _googleSignIn.signIn();

//   final GoogleSignInAuthentication googleAuth =
//       await currentUser.authentication;

//   // Authenticate with firebase
//   final User user = await firebaseAuth.signInWithGoogle(
//     idToken: googleAuth.idToken,
//     accessToken: googleAuth.accessToken,
//   );

//   assert(user != null);
//   assert(!user.isAnonymous);

//   return user;
// }

Future<Null> signOutWithGoogle() async {
  // Sign out with firebase
  await firebaseAuth.signOut();
  // Sign out with google
  await googleSignIn.signOut();
}
