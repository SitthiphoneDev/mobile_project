import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/generated/assets.gen.dart';
import 'package:mobile_project/widgets/botton_widget.dart';
import 'package:mobile_project/widgets/form_filed_widget.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
   const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [ 
          Assets.images.login.image(height: 200),
          const SizedBox(height: 20),
            FormFieldWidget(
              label: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),            
            FormFieldWidget(
              label: 'Password',
              hintText: 'Enter your password',
              isPassword: true,
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            
            const SizedBox(height: 20),
            ButtonWidget(
              text: 'Login',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}