import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                //Header Section
                const SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: CustomHeader(
                      title: 'سبد خرید',
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 65),
                  sliver: SliverGrid.builder(
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 0,
                      mainAxisExtent: 290,
                    ),
                    itemBuilder: (context, index) {
                      return const BasketProductCart();
                    },
                  ),
                )
              ],
            ),
            //Buy Button Section
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      width: 2,
                      color: CustomColors.mainGrayText,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('تکمیل فرایند خرید'),
                    ),
                    const Spacer(),
                    Text(
                      '500000 تومان',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BasketProductCart extends StatelessWidget {
  const BasketProductCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: CustomColors.mainGrayText,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 150,
                color: CustomColors.textFieldBackground,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'عادت های اتمی',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.shield_outlined,
                        color: CustomColors.mainGrayText,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'ضمانت سلامت کالا',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.delivery_dining_outlined,
                        color: CustomColors.mainGrayText,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'ارسال سریع',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: CustomColors.mainGrayText,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    Text(
                      '1',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '20000تومان تخفیف',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    '20000تومان',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
