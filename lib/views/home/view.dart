import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_task/bloc/meal_bloc/meal_bloc.dart';
import 'package:meal_task/utils/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealBloc, MealState>(
      bloc: context.read<MealBloc>(),
      builder: (context, state) {
        log('build method called');
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

class MealDetailTile extends StatefulWidget {
  final Map<String, dynamic> meal;

  const MealDetailTile({super.key, required this.meal});

  @override
  State<MealDetailTile> createState() => _MealDetailTileState();
}

class _MealDetailTileState extends State<MealDetailTile> {
  late List<Map<String, dynamic>> products;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    products = widget.meal['products'] as List<Map<String, dynamic>>;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.textWhite,
      ),
      child: Column(
        children: [
          MealTitleWidget(
            meal: widget.meal,

            button: Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: products.isNotEmpty
                          ? isEditing
                              ? AppColors.green
                              : AppColors.textBlack
                          : AppColors.textWhite,
                    ),
                    backgroundColor: products.isNotEmpty
                        ? AppColors.textWhite
                        : AppColors.gray,
                    foregroundColor: products.isNotEmpty
                        ? isEditing
                            ? AppColors.green
                            : AppColors.textBlack
                        : AppColors.textWhite,
                  ),
                  onPressed: () => isEditing ? _saveMeal() : _editMeal(),
                  child: Text(
                      products.isNotEmpty
                          ? isEditing
                              ? 'save'
                              : 'Edit'
                          : 'No Product',
                      textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      )),
                ),
                if (!isEditing && products.isNotEmpty)
                  const Icon(
                    Icons.bookmark_outline_rounded,
                    color: Colors.grey,
                    // size: 15,
                  ),
              ],
            ),
          ),
          if (products.isNotEmpty)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: AppColors.primaryColor,
              ),
              child: Column(
                children: [
                  ListView.separated(
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            products[index]['name'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.textGrey),
                          )),
                          Text('${products[index]['calories']} Cals',
                              style: Theme.of(context).textTheme.bodyLarge),
                          IconButton(
                              onPressed: () => isEditing? context.read<MealBloc>().add(RemoveProduct(widget.meal['name'], index)): null,
                              icon: Icon(
                                !isEditing
                                    ? Icons.arrow_circle_right_rounded
                                    : Icons.cancel,
                                color: !isEditing
                                    ? AppColors.textBlack.withOpacity(.8)
                                    : AppColors.red,
                              )),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    shrinkWrap: true,
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text('Total',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: AppColors.green))),
                      Text('${sumCalories(products)} Cals',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColors.green)),
                      const SizedBox(
                        width: 50,
                      ),
                    ],
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  _editMeal() {
    setState(() {
      isEditing = true;
    });
  }

  _saveMeal() {
    setState(() {
      isEditing = false;
    });
  }

  int sumCalories(List<Map<String, dynamic>> meals) {
    int totalCalories = 0;
    for (var meal in meals) {
      totalCalories += meal['calories'] as int;
    }
    return totalCalories;
  }
}

class MealTitleWidget extends StatelessWidget {
  final Map<String, dynamic> meal;
  final Widget button;

  const MealTitleWidget({
    super.key,
    required this.meal,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    log('row build method called');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: AppColors.primaryColor,
          ),
          child: Icon(
            meal['icon'] as IconData,
            color: Colors.black,
            fill: 1,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(
                meal['name'] as String,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              button,
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(5),
              // topLeft: Radius.circular(5),
            ),
          ),
          child: InkWell(
            onTap: () => context.read<MealBloc>().add(AddProduct(meal['name'])),
            child: Container(
                width: 40,
                height: 50,
                margin: const EdgeInsets.only(left: 10, bottom: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                  color: AppColors.textBlack,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}
