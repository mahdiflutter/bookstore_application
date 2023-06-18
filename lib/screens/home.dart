import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/widgets/custom_badge.dart';
import 'package:bookstore_app/widgets/custom_category_chip.dart';
import 'package:bookstore_app/widgets/custom_page_container.dart';
import 'package:bookstore_app/widgets/custom_product_cart.dart';
import 'package:bookstore_app/widgets/custom_search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController sliderController = PageController(
    viewportFraction: 0.8,
    initialPage: 1,
  );
  @override
  Widget build(BuildContext context) {
    return CustomPageContainer(
      hasTitle: false,
      elements: [
        //Serach Box Section
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          sliver: SliverToBoxAdapter(
            child: CustomSerachBox(),
          ),
        ),
        //Slider Section
        SliverToBoxAdapter(
          child: CustomSlider(sliderController: sliderController),
        ),
        //Categories List Section
        const SliverPadding(
          padding: EdgeInsets.only(
            right: 30,
            bottom: 20,
          ),
          sliver: SliverToBoxAdapter(
            child: CustomCategoriesList(),
          ),
        ),
        //Products list Section
        const SliverToBoxAdapter(
          child: ProductsList(),
        ),
        //ADS Banner Sectiopn
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          sliver: SliverToBoxAdapter(
            child: AdsBanner(),
          ),
        ),
        //Products list Section
        const SliverToBoxAdapter(
          child: ProductsList(),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          sliver: SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/notfound.png',
            ),
          ),
        )
      ],
    );
  }
}

class AdsBanner extends StatelessWidget {
  const AdsBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125,
      decoration: BoxDecoration(
        color: CustomColors.textFieldBackground,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      color: CustomColors.mainGreen,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'پیشنهاد',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'شگفت',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'انگیز!',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/sugguestedproducts.png',
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const CustomProductCart(
              hasShaddow: false,
            );
          }
        },
      ),
    );
  }
}

class CustomCategoriesList extends StatelessWidget {
  const CustomCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 9,
        itemBuilder: (context, index) {
          return const CustomCategoryChip();
        },
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.sliderController,
  });

  final PageController sliderController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: PageView.builder(
              controller: sliderController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 111,
                  decoration: BoxDecoration(
                    color: CustomColors.textFieldBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SmoothPageIndicator(
            controller: sliderController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: CustomColors.mainBlue,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 8,
            ),
          ),
        ],
      ),
    );
  }
}
