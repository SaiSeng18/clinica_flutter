import 'package:clinica_flutter/colors/colors.dart';
import 'package:clinica_flutter/components/auth_logo.dart';
import 'package:clinica_flutter/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  final String? role;
  const SignUpPage({super.key, this.role});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        AuthLogo(),
        const Text(
          "Sign Up",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthTextField(
              label: "Username",
              controller: _usernameController,
            ),
            const SizedBox(
              height: 20,
            ),
            AuthTextField(
              label: "Email",
              controller: _usernameController,
              password: true,
            ),
            const SizedBox(
              height: 20,
            ),
            AuthTextField(
              label: "Password",
              controller: _usernameController,
              password: true,
            ),
            const SizedBox(
              height: 20,
            ),
            AuthTextField(
              label: "Confirm Password",
              controller: _usernameController,
              password: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => {},
                child: const Text("Forgot Password?"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(MyColors.primaryColor),
                ),
                onPressed: () => {
                  GoRouter.of(context).go("/"),
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => {
                  GoRouter.of(context).push("/login"),
                },
                child: const Text("Have an account? Login"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
