import 'package:bookstore_app/widgets/custom_header.dart';
import 'package:bookstore_app/widgets/custom_page_container.dart';
import 'package:bookstore_app/widgets/custom_product_cart.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  const ProductsByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageContainer(
      elements: [
        //Headre section
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          sliver: SliverToBoxAdapter(
            child: CustomHeader(title: 'روان شناسی'),
          ),
        ),
        //Products List Section
        SliverPadding(
          padding: const EdgeInsets.only(
            right: 30,
            left: 15,
          ),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 230,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return const CustomProductCart(
                hasShaddow: true,
              );
            },
          ),
        )
      ],
    );
  }
}
