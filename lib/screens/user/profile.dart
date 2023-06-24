import 'package:bookstore_app/constants/custom_colors.dart';
// import 'package:bookstore_app/widgets/custom_header.dart';
import 'package:bookstore_app/widgets/custom_page_container.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageContainer(
      hasTitle: true,
      title: 'حساب کاربری',
      elements: [
        //Prpfile Image Section
        SliverToBoxAdapter(
          child: CircleAvatar(
            backgroundColor: CustomColors.mainGrayText,
            maxRadius: 50,
            minRadius: 40,
          ),
        ),
        //Profile Info Section
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'مهدی حیدری',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  '09214840491',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
        ),
        //Address Section
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'آدرس من',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('ویرایش'),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 43,
                  decoration: BoxDecoration(
                    color: CustomColors.textFieldBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'تهران،منطقه11،خیابان شیخ هادی،پلاک215',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //Address Section
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'کد پستی من',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('ویرایش'),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 43,
                  decoration: BoxDecoration(
                    color: CustomColors.textFieldBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '2541869745',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
                Text(
                  'تمامی اطلاعات کاربران نزد بوک استور محفوظ میباشد.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
          ),
        ),
        //Wallet Info Section
        const WalletInfo(),
        //SignOut Button Section
        const SignOutButton()
      ],
    );
  }
}

class WalletInfo extends StatelessWidget {
  const WalletInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 2,
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              color: CustomColors.mainGrayText,
            ),
            Text(
              'موجودی حساب',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '250000 تومان',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('افزایش موجودی'),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 2,
              margin: const EdgeInsets.only(
                top: 10,
              ),
              color: CustomColors.mainGrayText,
            ),
          ],
        ),
      ),
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 43,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColors.textFieldBackground,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'خروج از حساب',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.power_settings_new_outlined,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
