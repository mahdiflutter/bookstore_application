// import 'package:bookstore_app/widgets/custom_header.dart';
import 'package:bookstore_app/bloc/category/category_bloc.dart';
import 'package:bookstore_app/bloc/category/category_event.dart';
import 'package:bookstore_app/bloc/category/category_state.dart';
import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/data/model/category.dart';
import 'package:bookstore_app/widgets/custom_cached_image.dart';
import 'package:bookstore_app/widgets/custom_page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CategoryBloc>(context).add(
      CategorySendRequestEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) => CustomPageContainer(
        hasTitle: true,
        title: 'دسته بندی ها',
        elements: [
          if (state is CategoryResponseState) ...[
            //Categories List Section
            state.response.fold(
              (error) {
                return SliverToBoxAdapter(
                  child: Text(error),
                );
              },
              (success) {
                return SliverGrid.builder(
                  itemCount: success.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 4.5,
                    mainAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      category: success[index],
                    );
                  },
                );
              },
            )
          ],
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: CustomColors.textFieldBackground,
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CustomCachedImage(
              url: category.iconUrl,
              radius: 0,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Spacer(),
          const Icon(
            Icons.chevron_right_rounded,
          ),
        ],
      ),
    );
  }
}
