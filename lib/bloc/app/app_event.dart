import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {}

class Authorized extends AppEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Unauthorized extends AppEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
