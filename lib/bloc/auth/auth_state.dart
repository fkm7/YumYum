part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    required this.isLoading,
    required this.isAuthorized,
  });

  final bool isLoading;
  final bool isAuthorized;

  @override
  List<Object?> get props => [isLoading, isAuthorized];
}
