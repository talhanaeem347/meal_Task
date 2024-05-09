import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_task/bloc/meal_bloc/meal_bloc.dart';
import 'package:meal_task/utils/exports.dart';

class ProductsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final bool isEditing;
  final String mealName;

  const ProductsWidget(
      {super.key,
      required this.products,
      required this.isEditing,
      required this.mealName});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      onPressed: () => isEditing
                          ? context
                              .read<MealBloc>()
                              .add(RemoveProduct(mealName, index))
                          : null,
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
    );
  }

  int sumCalories(List<Map<String, dynamic>> meals) {
    int totalCalories = 0;
    for (var meal in meals) {
      totalCalories += meal['calories'] as int;
    }
    return totalCalories;
  }
}
