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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Digite seu email'),
              validator: (value) {
                bool isValid = EmailValidator.validate(emailController.text);
                if (isValid == false) return 'Not a valid email';
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Digite sua senha'),
              validator: (value) {
                if (passwordController.text.length < 8) {
                  return 'Password too short';
                } else if (!passwordController.text.contains(
                  RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                )) {
                  return 'Password should have an special character';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            DefaultButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  navigatorKey.currentState?.pushNamed('/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Algumas informações estão incorretas',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              text: 'Go to Home',
            ),
          ],
        ),
      ),
    );
  }
}
