import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sot/pages/home/home_page.dart';
import 'package:sot/pages/main/main_page.dart';

Route<T> fadePageBuilder<T>(
    BuildContext context, Widget child, CustomPage page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 600),
    settings: page,
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (_, anim1, __, child) => FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(anim1),
      child: child,
    ),
  );
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: MainPage,
      initial: true,
      children: [
        AutoRoute(
          page: HomePage,
          initial: true,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
