String getSignInErrorMessage(String error) {
  var errorMessage = '';
  switch (error) {
    case 'invalid-email':
      errorMessage = 'Thrown if the email address is not valid.';
      break;
    case 'user-disabled':
      errorMessage =
          'Thrown if the user corresponding to the given email has been disabled.';
      break;
    case 'user-not-found':
      errorMessage = 'Thrown if there is no user corresponding to the given email.';
      break;
    case 'wrong-password':
      errorMessage =
          'Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.';
      break;
    default:
      errorMessage = 'Unknown Error';
      break;
  }
  return errorMessage;
}

String getSignUpErrorMessage(String error) {
  var errorMessage = '';
  switch (error) {
    case 'email-already-in-use':
      errorMessage =
          'Thrown if there already exists an account with the given email address.';
      break;
    case 'invalid-email':
      'Thrown if the email address is not valid.';
      break;
    case 'operation-not-allowed':
      errorMessage =
          'Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.';
      break;
    case 'weak-password':
      errorMessage = 'Thrown if the password is not strong enough.';
      break;
    default:
      errorMessage = 'Unknown Error';
      break;
  }
  return errorMessage;
}

calculateDistance() {
  return 50.0;
}
