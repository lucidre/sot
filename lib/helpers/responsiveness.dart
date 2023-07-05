import 'package:flutter/material.dart';

import '../constants/duration.dart';

const int largeScreenSize = 1366; //tv
const int mediumScreenSize = 768; //laptop
const int smallScreenSize = 360; // phones etc
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;
  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
      MediaQuery.of(context).size.width < largeScreenSize;
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;
  static bool isCustomScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
      MediaQuery.of(context).size.width <= customScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        return AnimatedSwitcher(
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeOutBack,
          duration: const Duration(
            milliseconds: 300,
          ),
          child: () {
            if (width >= largeScreenSize) {
              return largeScreen;
            } else if (width < largeScreenSize && width >= mediumScreenSize) {
              return mediumScreen ?? largeScreen;
            } else {
              return smallScreen ?? largeScreen;
            }
          }(),
        );
      },
    );
  }
}
