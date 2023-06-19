import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: CustomColors.mainBlue,
      size: 80,
    );
  }
}
