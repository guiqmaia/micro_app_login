import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Digite seu email'),
            validator: (value) {
              bool isValid = EmailValidator.validate(value.toString());
              if (isValid == false) return 'Not a valid email';
              return null;
            },
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'Digite sua senha'),
            validator: (value) {
              if (value!.length < 8) {
                return 'Password too short';
              } else if (!value.contains(
                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
              )) {
                return 'Password should have an special character';
              }
              return null;
            },
          ),
          DefaultButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                navigatorKey.currentState?.pushNamed('/home');
              }
            },
            text: 'Go to Home',
          ),
        ],
      ),
    );
  }
}
