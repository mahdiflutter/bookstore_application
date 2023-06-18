import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          content,
          style: const TextStyle(
            fontFamily: 'vazirbold',
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
