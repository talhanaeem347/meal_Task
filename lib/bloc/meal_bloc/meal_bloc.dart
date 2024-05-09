import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_task/utils/exports.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc() : super(MealState.initial()) {
    on<AddProduct>(_mapAddProductToState);
    on<RemoveProduct>(_mapRemoveProductToState);
  }

  FutureOr<void> _mapAddProductToState(
      AddProduct event, Emitter<MealState> emit) {
    int index =
        state.meals.indexWhere((element) => element['name'] == event.name);
    Map<String, dynamic> product = {
      'name': 'Fresh Mango juice',
      'calories': 150,
    };
    state.meals[index]['products'].add(product);
    emit(state.copyWith(meals: state.meals, productAdded: true));
    emit(state.copyWith(meals: state.meals, productAdded: false));
  }

  FutureOr<void> _mapRemoveProductToState(
      RemoveProduct event, Emitter<MealState> emit) {
    int index =
        state.meals.indexWhere((element) => element['name'] == event.name);
    (state.meals[index]['products'] as List).removeAt(event.index);
    emit(state.copyWith(meals: state.meals, productRemoved: true));
    emit(state.copyWith(meals: state.meals, productRemoved: false));
  }
}
