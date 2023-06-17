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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headerText,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                descriptionText,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 15,
              ),
              for (var element in body) ...[
                element,
                const SizedBox(
                  height: 20,
                ),
              ],
              Text(
                footerText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
