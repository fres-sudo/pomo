import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
            "Stats"
        ),
      ),
    );
  }
}
