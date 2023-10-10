import 'package:clinica_flutter/colors/colors.dart';
import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
