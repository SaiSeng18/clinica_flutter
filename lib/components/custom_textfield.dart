import 'package:clinica_flutter/colors/colors.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool password;
  const AuthTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.password = false});

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: TextField(
            controller: widget.controller,
            obscureText: widget.password,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyColors.primaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyColors.primaryColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            style: const TextStyle(),
          ),
        ),
      ],
    );
  }
}
