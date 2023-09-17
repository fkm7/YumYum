import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(super.initialState) {
    on<SignIn>((event, emit) => null);
    on<SignUp>((event, emit) => null);
    on<SignOut>((event, emit) => null);
  }
}
