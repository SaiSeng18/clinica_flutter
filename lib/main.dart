import 'package:clinica_flutter/colors/colors.dart';
import 'package:clinica_flutter/components/navbar.dart';
import 'package:clinica_flutter/pages/auth/role_page.dart';
import 'package:clinica_flutter/pages/home_page.dart';
import 'package:clinica_flutter/pages/hospital_page.dart';
import 'package:clinica_flutter/pages/auth/login_page.dart';
import 'package:clinica_flutter/pages/auth/signup_page.dart';
import 'package:clinica_flutter/pages/profile_page.dart';
import 'package:clinica_flutter/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _authNavigatorKey = GlobalKey<NavigatorState>();
bool auth = true;

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/",
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => NavbarShell(child: child),
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/',
          redirect: (context, state) {
            if (!auth) {
              return "/login/role";
            } else {
              return null;
            }
          },
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage(
            key: state.pageKey,
            child: const HomePage(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/hospitals',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage(
            key: state.pageKey,
            child: const HospitalPage(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/search',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage(
            key: state.pageKey,
            child: const SearchPage(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/profile',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage(
            key: state.pageKey,
            child: const ProfilePage(),
          ),
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _authNavigatorKey,
      builder: (context, state, child) => AuthShell(
        child: child,
      ),
      routes: [
        GoRoute(
          parentNavigatorKey: _authNavigatorKey,
          path: "/login/role",
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const RolePage(),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _authNavigatorKey,
          path: "/login",
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const LoginPage(),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _authNavigatorKey,
          path: '/signup',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const SignUpPage(),
            );
          },
        ),
      ],
    ),
  ],
);

class AuthShell extends StatelessWidget {
  final Widget child;
  const AuthShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // canvasColor: MyColors.primaryColor,
          // colorScheme: MyColors.colorScheme,
          ),
      routerConfig: _router,
    );
  }
}

class NavbarShell extends StatefulWidget {
  const NavbarShell({super.key, required this.child});

  final Widget child;

  @override
  State<NavbarShell> createState() => _NavbarShellState();
}

class _NavbarShellState extends State<NavbarShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                // color: Colors.blue, // Color of the top navigation bar
                height: 100, // Height of the top navigation bar
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                // controller: widget.controller,
                                // obscureText: widget.password,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20),
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
                            Center(
                              child: IconButton(
                                onPressed: () =>
                                    {GoRouter.of(context).push("/search")},
                                icon: const Icon(Icons.search),
                                color: MyColors.primaryColor,
                                iconSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.menu),
                          iconSize: 40,
                          splashRadius: 1,
                          color: MyColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top:
                  100, // Adjust this value to match the height of the top navigation bar
              left: 0,
              right: 0,
              bottom: 0,
              child: widget.child,
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Navbar(),
            )
          ],
        ),
      ),
    );
  }
}
