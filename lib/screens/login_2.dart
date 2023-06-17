import 'package:bookstore_app/widgets/custom_elvated_button.dart';
import 'package:bookstore_app/widgets/custom_form_container.dart';
import 'package:bookstore_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomForm(
      headerText: 'تایید حساب کاربری',
      descriptionText: 'یک کد 5 رقمی برای شما ارسال شد، آن را وارد نمایید.',
      footerText:
          'با ورود به حساب کاربری قوانین و شرایط بوک استور را می پذیرید.',
      body: [
        CustomTextField(
          controller: codeController,
          hintText: '_ _ _ _ _',
        ),
        CustomElvatedButton(
          labelText: 'تایید و ورود به حساب',
          clicked: () {},
        ),
      ],
    );
  }
}
