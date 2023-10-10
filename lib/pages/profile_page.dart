import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            const Text("Profile Page"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Remember tho you can't go back with the back button because it's a go route not push if you want to know what's the difference just check the docs",
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => {GoRouter.of(context).go("/login/role")},
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
