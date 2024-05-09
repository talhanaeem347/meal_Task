part of 'meal_bloc.dart';

class MealState {
  List<Map<String, dynamic>> _meals = [];

  MealState(
      {required List<Map<String, dynamic>> meals,
      this.productAdded = false,
      this.productRemoved = false}) {
    _meals = meals;
  }

  List<Map<String, dynamic>> get meals => _meals;

  bool productAdded = false;
  bool productRemoved = false;

  MealState.initial() {
    _meals = [
      {
        'name': 'First Meal',
        'icon': CupertinoIcons.sunrise_fill,
        'products': <Map<String,dynamic>>[
          {
            'name': 'Spicy Bacon Cheese Toast',
            'calories': 200,
          },
          {
            'name': 'Almond Milk',
            'calories': 100,
          }
        ]
      },
      {'name': 'Second Meal', 'icon': FontAwesomeIcons.clone, 'products': <Map<String,dynamic>>[]},
      {
        'name': 'Third Meal',
        'icon': CupertinoIcons.sun_max_fill,
        'products': <Map<String,dynamic>>[]
      },
      {
        'name': 'Fourth Meal',
        'icon': CupertinoIcons.sun_haze_fill,
        'products': <Map<String,dynamic>>[]
      },
      {'name': 'Fifth Meal', 'icon': Icons.nightlight, 'products': <Map<String,dynamic>>[]},
      {'name': 'Sixth Meal', 'icon': Icons.nights_stay, 'products': <Map<String,dynamic>>[]}
    ];
  }

  MealState copyWith(
      {List<Map<String, dynamic>>? meals,
      bool? productAdded,
      bool? productRemoved}) {
    return MealState(
        meals: meals ?? this.meals,
        productAdded: productAdded ?? this.productAdded,
        productRemoved: productRemoved ?? this.productRemoved);
  }
}
