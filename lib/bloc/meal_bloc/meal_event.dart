part of 'meal_bloc.dart';

sealed class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object> get props => [];
}

class AddProduct extends MealEvent {
  final String name;

  const AddProduct(this.name);

  @override
  List<Object> get props => [name];
}

class RemoveProduct extends MealEvent {
  final String name;
  final int index;

  const RemoveProduct(this.name, this.index);

  @override
  List<Object> get props => [name, index];
}
