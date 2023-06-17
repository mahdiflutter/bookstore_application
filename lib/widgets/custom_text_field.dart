import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          textAlign: TextAlign.center,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            fillColor: CustomColors.textFieldBackground,
            hintText: hintText,
          ),
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
