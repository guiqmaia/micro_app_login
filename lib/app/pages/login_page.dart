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
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Digite sua senha'),
            ),
            const SizedBox(height: 20),
            DefaultButton(
              onPressed: () {
                navigatorKey.currentState?.pushNamed('/home');
              },
              text: 'Go to Home',
            ),
          ],
        ),
      ),
    );
  }
}
