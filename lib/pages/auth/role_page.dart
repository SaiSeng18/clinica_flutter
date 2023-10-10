import 'package:clinica_flutter/colors/colors.dart';
import 'package:clinica_flutter/components/auth_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  List<Map<String, String>> role = [
    {"label": "Patient", "value": "patient"},
    {"label": "Doctor", "value": "doctor"},
    {"label": "Nurse", "value": "nurse"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        AuthLogo(),
        const Text(
          "Which user are you?",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        RoleButton(label: role[0]["label"]!, role: role[0]["value"]!),
        SizedBox(
          height: 16,
        ),
        RoleButton(label: role[1]["label"]!, role: role[1]["value"]!),
        SizedBox(
          height: 16,
        ),
        RoleButton(label: role[2]["label"]!, role: role[2]["value"]!),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class RoleButton extends StatelessWidget {
  const RoleButton({super.key, required this.label, required this.role});
  final String label;
  final String role;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 70,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(100.0), // Set the border radius here
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(MyColors.primaryColor),
        ),
        onPressed: () => {context.push("/login", extra: role)},
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
