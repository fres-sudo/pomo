import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static const _tabletWidth = 1000;
  static const _mobileWidth = 650;

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < _mobileWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < _tabletWidth &&
          MediaQuery.of(context).size.width >= _mobileWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= _tabletWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth >= _tabletWidth){
            return desktop;
          }
          if(constraints.maxWidth > _mobileWidth){
            return tablet;
          }
          return mobile;
        });
  }
}
