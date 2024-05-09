import 'package:meal_task/utils/exports.dart';
import 'package:meal_task/views/shared/meal_title_widget.dart';
import 'package:meal_task/views/shared/products_widget.dart';

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
            ProductsWidget(
              products: products,
              isEditing: isEditing,
              mealName: widget.meal['name'],
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
}
