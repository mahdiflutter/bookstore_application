import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/data/model/category.dart';
import 'package:bookstore_app/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';

class CustomCategoryChip extends StatelessWidget {
  const CustomCategoryChip({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 5,
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: CustomColors.mainOrange,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                  color: CustomColors.mainOrange,
                ),
              ],
            ),
            child: CustomCachedImage(
              url: category.iconUrl,
            ),
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
