import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_task/bloc/bloc_observer.dart';
import 'package:meal_task/bloc/meal_bloc/meal_bloc.dart';
import 'package:meal_task/utils/theme/theme.dart';
import 'package:meal_task/views/home/view.dart';

void main() {
  Bloc.observer = MyBlockObserver();
  runApp(MultiBlocProvider(providers: <BlocProvider>[
    BlocProvider<MealBloc>(
      create: (_) => MealBloc(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Task',
      theme: AppTheme.lightTheme,
      home: const HomePage(),

    );
  }
}
