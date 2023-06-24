import 'package:bookstore_app/bloc/product/product_bloc.dart';
import 'package:bookstore_app/bloc/product/product_event.dart';
import 'package:bookstore_app/bloc/product/product_state.dart';
import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/data/model/comment.dart';
import 'package:bookstore_app/data/model/product.dart';
import 'package:bookstore_app/services/service_math.dart';
import 'package:bookstore_app/widgets/custom_badge.dart';
// import 'package:bookstore_app/services/service_math.dart';
// import 'package:bookstore_app/widgets/custom_badge.dart';
import 'package:bookstore_app/widgets/custom_cached_image.dart';
import 'package:bookstore_app/widgets/custom_comment_box.dart';
import 'package:bookstore_app/widgets/custom_header.dart';
import 'package:bookstore_app/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool viewComments = false;
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(
      ProductSendRequestEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return Stack(
                children: [
                  if (state is ProductLoadingState) ...[
                    const CustomLoading(),
                  ],
                  if (state is ProductResponseState) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: CustomScrollView(
                        slivers: [
                          //Header Section
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            sliver: SliverToBoxAdapter(
                              child: CustomHeader(
                                  title: widget.product.categoryId),
                            ),
                          ),
                          //Image Gallery Section
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 180,
                                  height: 260,
                                  child: CustomCachedImage(
                                    url: widget.product.imgUrl,
                                    radius: 0,
                                  ),
                                ),
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
                                    widget.product.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                  ProductVariant(
                                    icon: Icons.person_outline,
                                    title: 'نویسنده',
                                    value: widget.product.writerName,
                                  ),
                                  ProductVariant(
                                    icon: Icons.store_mall_directory_outlined,
                                    title: 'انتشارات',
                                    value: widget.product.publisher,
                                  ),
                                  widget.product.translator != ""
                                      ? ProductVariant(
                                          icon: Icons.translate,
                                          title: 'مترجم',
                                          value: widget.product.translator,
                                        )
                                      : const Row(),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  Text(
                                    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز...',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          state.commentsResponse.fold(
                            (error) {
                              return const SliverToBoxAdapter(
                                child: Text('error'),
                              );
                            },
                            (success) {
                              return //Comments Section
                                  SliverPadding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                sliver: SliverToBoxAdapter(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        viewComments = !viewComments;
                                      });
                                    },
                                    child: Comments(
                                      isOpen: viewComments,
                                      comments: success,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    //Buy Button Section
                    FooterButton(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<ProductBloc>(context).add(
                                  ProductAddToBasketEvent(
                                      product: widget.product),
                                );
                              },
                              child: const Text('افزودن به سبد خرید'),
                            ),
                            const Spacer(),
                            widget.product.discount != 0
                                ? SizedBox(
                                    height: 30,
                                    child: CustomBadge(
                                        content: '%${widget.product.discount}'),
                                  )
                                : const Spacer(),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                widget.product.discount != 0
                                    ? Text(
                                        CustomMacth.seperate3Digit(
                                            widget.product.realPrice),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      )
                                    : const Row(),
                                Text(
                                  CustomMacth.seperate3Digit(
                                    CustomMacth.calcuteDiscount(
                                      widget.product.discount,
                                      widget.product.realPrice,
                                    ),
                                  ),
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'تومان',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  if (state is ProductAddedToBasketState) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: CustomScrollView(
                        slivers: [
                          //Header Section
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            sliver: SliverToBoxAdapter(
                              child: CustomHeader(
                                  title: widget.product.categoryId),
                            ),
                          ),
                          //Image Gallery Section
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 180,
                                  height: 260,
                                  child: CustomCachedImage(
                                    url: widget.product.imgUrl,
                                    radius: 0,
                                  ),
                                ),
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
                                    widget.product.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                  ProductVariant(
                                    icon: Icons.person_outline,
                                    title: 'نویسنده',
                                    value: widget.product.writerName,
                                  ),
                                  ProductVariant(
                                    icon: Icons.store_mall_directory_outlined,
                                    title: 'انتشارات',
                                    value: widget.product.publisher,
                                  ),
                                  widget.product.translator != ""
                                      ? ProductVariant(
                                          icon: Icons.translate,
                                          title: 'مترجم',
                                          value: widget.product.translator,
                                        )
                                      : const Row(),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  Text(
                                    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز...',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          state.commentsResponse.fold(
                            (error) {
                              return const SliverToBoxAdapter(
                                child: Text('error'),
                              );
                            },
                            (success) {
                              return //Comments Section
                                  SliverPadding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                sliver: SliverToBoxAdapter(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        viewComments = !viewComments;
                                      });
                                    },
                                    child: Comments(
                                      isOpen: viewComments,
                                      comments: success,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    //Buy Button Section
                    FooterButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'این محصول به سبد خرید شما افزوده شد.',
                            style: TextStyle(
                              color: CustomColors.mainGreen,
                              fontFamily: 'vazirbold',
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class FooterButton extends StatelessWidget {
  const FooterButton({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              width: 1,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}

class ProductVariant extends StatelessWidget {
  const ProductVariant({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: CustomColors.mainGrayText,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 60,
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Text(
          ':',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}

class Comments extends StatelessWidget {
  const Comments({
    super.key,
    required this.isOpen,
    required this.comments,
  });
  final bool isOpen;
  final List<CommentModel> comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
              Icon(
                isOpen
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded,
              ),
            ],
          ),
        ),
        isOpen
            ? Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    for (var comment in comments)
                      CustomCommentBox(comment: comment),
                  ],
                ),
              )
            : const Row(),
      ],
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
