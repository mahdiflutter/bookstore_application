import 'package:bookstore_app/bloc/product/product_bloc.dart';
// import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/data/model/product.dart';
import 'package:bookstore_app/screens/product.dart';
import 'package:bookstore_app/services/service_math.dart';
import 'package:bookstore_app/widgets/custom_badge.dart';
import 'package:bookstore_app/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProductCart extends StatelessWidget {
  const CustomProductCart({
    super.key,
    required this.hasShaddow,
    required this.product,
  });
  final bool hasShaddow;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => ProductBloc(),
                  child: ProductScreen(
                    product: product,
                  ),
                ),
              ),
            );
          },
          child: Container(
            width: 140.0,
            height: 220.0,
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(width: 1),
                boxShadow: [
                  if (hasShaddow)
                    const BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 0.5,
                      offset: Offset(0, 3),
                    ),
                ]),
            child: Column(
              children: [
                Container(
                  width: 85,
                  height: 105,
                  margin: const EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                  ),
                  child: CustomCachedImage(
                    url: product.imgUrl,
                    radius: 0,
                  ),
                ),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.person),
                    Text(
                      product.writerName,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    product.discount != 0
                        ? CustomBadge(content: '%${product.discount}')
                        : const Spacer(),
                    const Spacer(),
                    Text(
                      CustomMacth.seperate3Digit(
                        CustomMacth.calcuteDiscount(
                            product.discount, product.realPrice),
                      ),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'تومان',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
