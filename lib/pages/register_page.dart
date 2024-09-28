import 'package:flutter/material.dart';
import 'package:food_app/services/auth/auth_service.dart';
import 'package:food_app/widgets/buttons.dart';
import 'package:food_app/widgets/text.dart';
import 'package:food_app/widgets/textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register() async {
    final authService = AuthService();

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: BodyText(text: e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            'password did not match',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo

            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Image.asset(
                'assets/logo.png',
                height: 100,
              ),
            ),

            const SizedBox(
              height: 32,
            ),

            // textfield

            MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false),

            const SizedBox(
              height: 10,
            ),

            MyTextfield(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),

            const SizedBox(
              height: 10,
            ),
            MyTextfield(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true),

            const SizedBox(
              height: 25,
            ),

            //button
            FillButton(text: "Sign Up", ontap: register),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already Registered?",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
