import 'package:bloc/bloc.dart';
import 'package:delmer/bloc/app/app_event.dart';
import 'package:delmer/bloc/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(initialState) : super(FirstRun()) {
    on<Unauthorized>((event, emit) => emit(UnauthorizedState()));
    on<Authorized>((event, emit) => emit(AuthorizedState()));
  }
}
