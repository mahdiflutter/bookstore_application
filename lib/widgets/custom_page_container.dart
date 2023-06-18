import 'package:flutter/material.dart';

class CustomPageContainer extends StatelessWidget {
  const CustomPageContainer({
    super.key,
    required this.elements,
  });
  final List<Widget> elements;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: elements,
        ),
      ),
    );
  }
}
