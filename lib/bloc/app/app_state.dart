import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {}

class FirstRun extends AppState {
  @override
  List<Object?> get props => const [];
}

class UnauthorizedState extends AppState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthorizedState extends AppState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
