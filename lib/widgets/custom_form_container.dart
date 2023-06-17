import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
    required this.body,
    required this.headerText,
    required this.descriptionText,
    required this.footerText,
  });
  final List<Widget> body;
  final String headerText;
  final String descriptionText;
  final String footerText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 15),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      headerText,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 15),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      descriptionText,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
                for (var formField in body) ...[
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 20),
                    sliver: SliverToBoxAdapter(
                      child: formField,
                    ),
                  ),
                ],
                SliverToBoxAdapter(
                  child: Text(
                    footerText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
