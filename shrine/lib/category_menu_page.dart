import 'package:flutter/material.dart';

import 'model/product.dart';
import 'colors.dart';

class CategoryMenuPage extends StatelessWidget {
  final List<Category> _categories = Category.values;
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;

  const CategoryMenuPage({
    Key? key,
    required this.currentCategory,
    required this.onCategoryTap,
  }) : super(key: key);

  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString =
        category.toString().replaceAll('Category.', '').toUpperCase();
    final ThemeData themeData = Theme.of(context);

    return GestureDetector(
      onTap: () => onCategoryTap(category),
      child: category == currentCategory
          ? Column(
              children: <Widget>[
                SizedBox(height: 16),
                Text(
                  categoryString,
                  style: themeData.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14),
                Container(
                  width: 70,
                  height: 2,
                  color: kShrinePink400,
                )
              ],
            )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                categoryString,
                style: themeData.textTheme.bodyText1!
                    .copyWith(color: kShrineBrown900.withAlpha(153)),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          padding: EdgeInsets.only(top: 40),
          color: kShrinePink100,
          child: ListView(
            children: _categories
                .map((Category category) => _buildCategory(category, context))
                .toList(),
          ),
        ),
      );
}
