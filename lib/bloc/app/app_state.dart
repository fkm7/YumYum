import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {}

class InitialState extends AppState {
  @override
  List<Object?> get props => const [];
}
