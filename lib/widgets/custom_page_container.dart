import 'package:bookstore_app/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class CustomPageContainer extends StatelessWidget {
  const CustomPageContainer({
    super.key,
    required this.elements,
    required this.hasTitle,
    this.title = '',
  });
  final List<Widget> elements;
  final bool hasTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            //Header Section
            if (hasTitle)
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                sliver: SliverToBoxAdapter(
                  child: CustomHeader(title: title),
                ),
              ),
            ...elements,
          ],
        ),
      ),
    );
  }
}
