part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class SignIn extends AuthEvent {
  SignIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  @override
  List<Object?> get props => [email, password];
}

class SignUp extends AuthEvent {
  SignUp({
    required this.fullname,
    required this.email,
    required this.password,
  });

  final String fullname;
  final String email;
  final String password;

  @override
  List<Object?> get props => [fullname, email, password];
}

class SignOut extends AuthEvent {
  @override
  List<Object?> get props => [];
}
