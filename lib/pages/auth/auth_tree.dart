import 'package:clinica_flutter/pages/auth/login_page.dart';
import 'package:clinica_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';

class AuthTree extends StatefulWidget {
  const AuthTree({super.key});

  @override
  State<AuthTree> createState() => _AuthTreeState();
}

class _AuthTreeState extends State<AuthTree> {
  bool auth = true;

  @override
  Widget build(BuildContext context) {
    return auth ? const HomePage() : const LoginPage();
  }
}
