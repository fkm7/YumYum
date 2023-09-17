import 'package:delmer/data/prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  AuthService._internal();

  static AuthService? _instance;

  static AuthService getInstance() {
    _instance ??= AuthService._internal();
    return _instance!;
  }

  final _auth = FirebaseAuth.instance;
  final _googleProvider = GoogleSignIn();

  Future<User?> signIn(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return credential.user!;
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (error, _) {
      if (kDebugMode) {
        print(error);
        print(_.toString());
      }
    }
    return null;
  }

  Future<User?> signUp(
    String fullname,
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user?.updateDisplayName(fullname);
      return credential.user;
    } on FirebaseAuthException {
      rethrow;
    } catch (e, _) {
      if (kDebugMode) {
        print('$e $_');
      }
    }
    return null;
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException {
      rethrow;
    } catch (e, _) {
      if (kDebugMode) {
        print('$e $_');
      }
    }
  }

  Future<void> updatePassword(String password) async {
    try {
      await _auth.currentUser?.updatePassword(password);
    } on FirebaseAuthException {
      rethrow;
    } catch (e, s) {
      if (kDebugMode) {
        print('$e $s');
      }
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final googleSignInResult = await _googleProvider.signIn();
      if (googleSignInResult != null) {
        final auth = await googleSignInResult.authentication;
        final google = GoogleAuthProvider.credential(
          idToken: auth.idToken,
          accessToken: auth.accessToken,
        );
        final result = await _auth.signInWithCredential(google);
        return result.user;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<User?> signInWithTwitter() async {
    return null;
  }

  Future<User?> signInWithFacebook() async {
    return null;
  }

  Future<void> signOut() async {
    try {
      await setAuthenticationState(false);
      await _googleProvider.signOut();
      await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
