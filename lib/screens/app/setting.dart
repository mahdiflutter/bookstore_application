import 'package:bookstore_app/constants/custom_colors.dart';
// import 'package:bookstore_app/widgets/custom_header.dart';
import 'package:bookstore_app/widgets/custom_page_container.dart';
import 'package:flutter/material.dart';

class SettingsAppScreen extends StatelessWidget {
  const SettingsAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageContainer(
      hasTitle: true,
      title: 'تنظیمات برنامه',
      elements: [
        //Settings Item Section
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          sliver: SliverGrid.builder(
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 70,
            ),
            itemBuilder: (context, index) {
              return const SettingItemCart();
            },
          ),
        )
      ],
    );
  }
}

class SettingItemCart extends StatelessWidget {
  const SettingItemCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: CustomColors.mainDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.dark_mode_outlined,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            'تغییر پوسته',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_right_outlined,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
