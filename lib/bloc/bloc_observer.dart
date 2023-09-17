import 'package:bloc/bloc.dart';
import 'package:l/l.dart';

class ChangeObserver extends BlocObserver {
  const ChangeObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    l.v('OnCreate: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    l.v('OnChange: ${bloc.runtimeType} $change');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    l.v('OnEvent: ${bloc.runtimeType} $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    l.e('OnError: ${bloc.runtimeType} $error', stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    l.v('Transition: ${bloc.runtimeType} $transition');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    l.v('OnClose: ${bloc.runtimeType}');
  }
}
