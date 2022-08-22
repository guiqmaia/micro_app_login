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
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Digite seu email'),
                validator: (value) {
                  bool isValid = EmailValidator.validate(value!);
                  if(!isValid) {
                    return 'email must be valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'Digite sua senha'),
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'password must not be empty';
                  } else if (value.length <= 6 ) {
                    return 'password should have more than 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
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
        ),
      ),
    );
  }
}
