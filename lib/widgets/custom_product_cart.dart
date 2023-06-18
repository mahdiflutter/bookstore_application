import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/widgets/custom_badge.dart';
import 'package:flutter/material.dart';

class CustomProductCart extends StatelessWidget {
  const CustomProductCart({
    super.key,
    required this.hasShaddow,
  });
  final bool hasShaddow;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 160.0,
          height: 220,
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
                color: CustomColors.textFieldBackground,
              ),
              Text(
                'عادت های اتمی',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.person),
                  Text(
                    'جیمز کلیر',
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
                  const CustomBadge(content: '%10'),
                  const Spacer(),
                  Text(
                    '85000',
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
      ],
    );
  }
}
