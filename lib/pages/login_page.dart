import 'package:flutter/material.dart';
import 'package:food_app/services/auth/auth_service.dart';
import 'package:food_app/widgets/buttons.dart';
import 'package:food_app/widgets/text.dart';
import 'package:food_app/widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: HeaderText(text: e.toString()),
              ));
    }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const HomePage(),
    //   ),
    // );

    // void forgotPw() {
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(title: Text('Forgot Password')),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              height: 40,
            ),

            //button
            FillButton(text: "Log In", ontap: login),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not a Member?",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text('Sign Up',
                      style: TextStyle(color: Colors.blue)),
                ),
                const SizedBox(
                  height: 32,
                ),
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
