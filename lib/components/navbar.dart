import 'package:clinica_flutter/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    super.key,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 8,
        activeColor: Colors.white,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: MyColors.primaryColor,

        // tabBorder: Border.all(color: Colors.black, width: 1),
        // tabActiveBorder: Border.all(color: MyColors.primaryColor, width: 1),
        color: MyColors.primaryColor,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
            onPressed: () => {
              GoRouter.of(context).push("/"),
            },
          ),
          GButton(
            icon: Icons.local_hospital,
            text: 'Hospitals',
            onPressed: () => {
              GoRouter.of(context).push("/hospitals"),
            },
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
            onPressed: () => {
              GoRouter.of(context).push("/search"),
            },
          ),
          GButton(
            icon: Icons.man,
            text: 'Profile',
            onPressed: () => {
              GoRouter.of(context).push("/profile"),
            },
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
