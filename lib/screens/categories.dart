import 'package:bookstore_app/widgets/custom_header.dart';
import 'package:bookstore_app/widgets/custom_page_container.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageContainer(
      hasTitle: true,
      title: 'دسته بندی ها',
      elements: [
        //Categories List Section
        SliverGrid.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4.5,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 5,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/category.png'),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'درسی و کمک درسی',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right_rounded,
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
