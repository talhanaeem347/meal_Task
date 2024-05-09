import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_task/bloc/meal_bloc/meal_bloc.dart';
import 'package:meal_task/utils/exports.dart';
import 'package:meal_task/views/shared/meal_details_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealBloc, MealState>(
      bloc: context.read<MealBloc>(),
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Meals',
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.ellipsis),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MealDetailTile(
                        meal: state.meals[index],
                      );
                    },
                    shrinkWrap: true,
                    itemCount: state.meals.length,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
