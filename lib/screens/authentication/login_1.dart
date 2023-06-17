import 'package:bookstore_app/widgets/custom_elvated_button.dart';
import 'package:bookstore_app/widgets/custom_form_container.dart';
import 'package:bookstore_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login1screen extends StatefulWidget {
  const Login1screen({super.key});

  @override
  State<Login1screen> createState() => _Login1screenState();
}

class _Login1screenState extends State<Login1screen> {
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomForm(
      headerText: 'ورود به حساب کاربری',
      descriptionText: 'شماره همراه خود را برای دریافت کد تایید وارد نمایید.',
      footerText:
          'با ورود به حساب کاربری قوانین و شرایط بوک استور را می پذیرید.',
      body: [
        CustomTextField(
          controller: numberController,
          hintText: 'مثال: 09214840491',
        ),
        CustomElvatedButton(
          labelText: 'دریافت کد تایید',
          clicked: () {},
        ),
      ],
    );
  }
}
