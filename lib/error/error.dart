import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;

const Map<String, AuthError> authErrorMap = {
  'user-not-found': AuthErrorUserNotFound(),
  'weak-password': AuthErrorWeakPassword(),
  'invalid-email': AuthErrorInvalidEmail(),
  'operation-not-allowed': AuthErrorOperationNotAllowed(),
  'email-already-in-use': AuthErrorEmailAlreadyInUse(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'no-current-user': AuthErrorNoCurrentUser(),
};

@immutable
abstract class AuthError {
  const AuthError({
    required this.title,
    required this.text,
  });

  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMap[exception.code.toLowerCase().trim()] ?? AuthErrorUnknown(exception);

  final String title;
  final String text;

  @override
  String toString() => title;
}

class AuthErrorUnknown extends AuthError {
  const AuthErrorUnknown(
    this.exception, {
    super.title = 'Authentication error',
    super.text = 'Unknown authentication error',
  });

  final FirebaseAuthException exception;

  @override
  String toString() => exception.code;
}

// firebase-auth/no-current-user
class AuthErrorNoCurrentUser extends AuthError {
  const AuthErrorNoCurrentUser({
    super.title = 'No current user!',
    super.text = 'No current user with this information was found!',
  });
}

// auth/requires-recent-login
class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin({
    super.title = 'Requires recent login',
    super.text = 'You need to log out and log back in again in order to perform this operation',
  });
}

// auth/operation-not-allowed
class AuthErrorOperationNotAllowed extends AuthError {
  const AuthErrorOperationNotAllowed({
    super.title = 'Operation not allowed',
    super.text = 'You cannot register using this method at this moment',
  });
}

// auth/user-not-found
class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound({
    super.title = 'User not found',
    super.text = 'The given user was not found on the server!',
  });
}

// auth/weak-password
class AuthErrorWeakPassword extends AuthError {
  const AuthErrorWeakPassword({
    super.title = 'Weak password!',
    super.text = 'Please choose a stronger password consisting of more characters!',
  });
}

// auth/invalid-email
class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail({
    super.title = 'Invalid email',
    super.text = 'Please double check your email and try again!',
  });
}

// auth/email-already-in-use
class AuthErrorEmailAlreadyInUse extends AuthError {
  const AuthErrorEmailAlreadyInUse({
    super.title = 'Email already in use',
    super.text = 'Please choose another email to register with!',
  });
}
