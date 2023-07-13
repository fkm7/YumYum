import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {}

class AppInit extends AppEvent {
  @override
  List<Object?> get props => const [];
}
