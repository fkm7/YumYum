import 'package:bloc/bloc.dart';
import 'package:delmer/bloc/app/app_event.dart';
import 'package:delmer/bloc/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(AppState initialState) : super(initialState) {
    on<AppInit>((event, emit) => emit(InitialState()));
  }
}
