import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomCategoryChip extends StatelessWidget {
  const CustomCategoryChip({super.key});

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
          ),
          Text(
            'روان شناسی',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
