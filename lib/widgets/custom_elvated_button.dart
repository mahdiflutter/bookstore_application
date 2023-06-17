import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton({
    super.key,
    required this.labelText,
    required this.clicked,
  });
  final String labelText;
  final dynamic clicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 43,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: () {
            clicked();
          },
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
