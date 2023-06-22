import 'package:bookstore_app/bloc/home/home_bloc.dart';
import 'package:bookstore_app/bloc/home/home_event.dart';
import 'package:bookstore_app/bloc/home/home_state.dart';
import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/data/model/banner.dart';
import 'package:bookstore_app/data/model/category.dart';
import 'package:bookstore_app/data/model/product.dart';
import 'package:bookstore_app/widgets/custom_cached_image.dart';
import 'package:bookstore_app/widgets/custom_category_chip.dart';
import 'package:bookstore_app/widgets/custom_loading.dart';
import 'package:bookstore_app/widgets/custom_page_container.dart';
import 'package:bookstore_app/widgets/custom_product_cart.dart';
import 'package:bookstore_app/widgets/custom_search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Use Bloc Builder for manage state
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CustomPageContainer(
          hasTitle: false,
          elements: [
            //Waiting time to receive information from the server
            if (state is HomeLoadingState) ...[
              const SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 50,
                ),
                sliver: SliverToBoxAdapter(
                  child: CustomLoading(),
                ),
              )
            ],
            //When the information is retrieved from the server
            if (state is HomeResponseState) ...[
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

              //Banner Slider Section
              state.bannersResponse.fold(
                (error) {
                  return SliverToBoxAdapter(
                    child: Text(error),
                  );
                },
                (success) {
                  return SliverToBoxAdapter(
                    child: CustomSlider(
                      sliderController: sliderController,
                      bannersList: success,
                    ),
                  );
                },
              ),

              //Categories List Section
              state.categoriesResponse.fold(
                (error) {
                  return SliverToBoxAdapter(
                    child: Text(error),
                  );
                },
                (success) {
                  return SliverPadding(
                    padding: const EdgeInsets.only(
                      right: 30,
                      bottom: 20,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: CustomCategoriesList(categorieslist: success),
                    ),
                  );
                },
              ),

              //Products list Section
              state.productsResponse.fold(
                (error) {
                  return SliverToBoxAdapter(
                    child: Text(error),
                  );
                },
                (success) {
                  return SliverToBoxAdapter(
                    child: ProductsList(
                      products: success,
                    ),
                  );
                },
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
              // const SliverToBoxAdapter(
              //   child: ProductsList(),
              // ),

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
          ],
        );
      },
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
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: CustomColors.mainGreen,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
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
                        height: 5,
                      ),
                      Image.asset(
                        'assets/images/sugguestedproducts.png',
                        width: 80,
                        height: 90,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return CustomProductCart(
              hasShaddow: false,
              product: products[index - 1],
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
    required this.categorieslist,
  });
  final List<CategoryModel> categorieslist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorieslist.length,
        itemBuilder: (context, index) {
          return CustomCategoryChip(
            category: categorieslist[index],
          );
        },
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.sliderController,
    required this.bannersList,
  });

  final PageController sliderController;
  final List<BannerModel> bannersList;

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
                  child: CustomCachedImage(
                    url: bannersList[index].urlAddress,
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
