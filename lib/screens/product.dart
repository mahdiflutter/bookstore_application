import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/widgets/custom_badge.dart';
import 'package:bookstore_app/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: CustomScrollView(
                slivers: [
                  //Header Section
                  const SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    sliver: SliverToBoxAdapter(
                      child: CustomHeader(title: 'عادت های اتمی'),
                    ),
                  ),
                  //Image Gallery Section
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          height: 260,
                          color: CustomColors.textFieldBackground,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: SizedBox(
                            height: 70,
                            child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const GalleryChip();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //Book information Setion
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Text(
                            'عادت های اتمی',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person_outline_rounded,
                                color: CustomColors.mainGrayText,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  'نویسنده',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                ':',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'جیمز کلیر',
                                style: Theme.of(context).textTheme.displaySmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Summary Section
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'خلاصه کتاب:',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز...',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Comments Section
                  const Comments(),
                  //Technical Info Section
                  const Comments(),
                ],
              ),
            ),
            //Buy Button Section
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      width: 1,
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('افزودن به سبد خرید'),
                      ),
                      const Spacer(),
                      const SizedBox(
                        height: 30,
                        child: CustomBadge(content: '10%'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '150000',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '135000',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'تومان',
                        style: Theme.of(context).textTheme.displayLarge,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Comments extends StatelessWidget {
  const Comments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          width: double.infinity,
          height: 43,
          decoration: BoxDecoration(
            color: CustomColors.textFieldBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                '21+ دیدگاه',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Spacer(),
              Text(
                'مشاهده',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Icon(
                Icons.arrow_drop_down_circle_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryChip extends StatelessWidget {
  const GalleryChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: CustomColors.mainGrayText,
          width: 1,
        ),
      ),
      child: Center(
        child: Container(
          width: 40,
          height: 60,
          color: CustomColors.textFieldBackground,
        ),
      ),
    );
  }
}
