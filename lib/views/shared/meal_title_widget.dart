import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_task/bloc/meal_bloc/meal_bloc.dart';
import 'package:meal_task/utils/exports.dart';
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
