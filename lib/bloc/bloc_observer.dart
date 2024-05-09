import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlockObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log("Bloc create at $bloc");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Bloc close at $bloc");
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Bloc change at $bloc: $change");
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("Bloc error at $bloc: Error:$error: stack trace:$stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Bloc transition at $bloc: $transition");
    super.onTransition(bloc, transition);
  }
}
