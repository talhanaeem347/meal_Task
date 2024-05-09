import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_task/utils/exports.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> meals = [
    {
      'name': 'First Meal',
      'icon': CupertinoIcons.sunrise_fill,
      'meals': [
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
    {
      'name': 'Second Meal',
      'icon': FontAwesomeIcons.clone,
    },
    {
      'name': 'Third Meal',
      'icon': CupertinoIcons.sun_max_fill,
    },
    {
      'name': 'Fourth Meal',
      'icon': CupertinoIcons.sun_haze_fill,
    },
    {
      'name': 'Fifth Meal',
      'icon': Icons.nightlight,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            return MealDetailTile(
              meal: meals[index],
            );
          },
          shrinkWrap: true,
          itemCount: 5,
        ));
  }
}

class MealDetailTile extends StatefulWidget {
  final Map<String, dynamic> meal;

  const MealDetailTile({super.key, required this.meal});

  @override
  State<MealDetailTile> createState() => _MealDetailTileState();
}

class _MealDetailTileState extends State<MealDetailTile> {
  List<Map<String, dynamic>>? meals;
  bool show = false;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    meals = widget.meal['meals'] as List<Map<String, dynamic>>?;
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
            onAdd: () {
              setState(() {
                show = !show;
              });
            },
            button: Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: meals != null
                          ? isEditing
                              ? AppColors.green
                              : AppColors.textBlack
                          : AppColors.textWhite,
                    ),
                    backgroundColor:
                        meals != null ? AppColors.textWhite : AppColors.gray,
                    foregroundColor: meals != null
                        ? isEditing
                            ? AppColors.green
                            : AppColors.textBlack
                        : AppColors.textWhite,
                  ),
                  onPressed: () {},
                  child: Text(
                      meals != null
                          ? isEditing
                              ? 'save'
                              : 'Edit'
                          : 'No Product',
                      textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      )),
                ),
                if (!isEditing && meals != null)
                  const Icon(
                    Icons.bookmark_outline_rounded,
                    color: Colors.grey,
                    // size: 15,
                  ),
              ],
            ),
            // onButtonTap: () {},
          ),
          if (show && meals != null)
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
                            meals![index]['name'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.textGrey),
                          )),
                          Text('${meals![index]['calories']} Cals',
                              style: Theme.of(context).textTheme.bodyLarge),
                          IconButton(
                              onPressed: () {},
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
                    itemCount: meals!.length,
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
                      Text('${sumCalories(meals!)} Cals',
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
  final VoidCallback onAdd;
  final Widget button;

  const MealTitleWidget({
    super.key,
    required this.meal,
    required this.onAdd,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 70,
          height: 70,
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
                height: 15,
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
            onTap: () => onAdd(),
            child: Container(
                width: 50,
                height: 60,
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
