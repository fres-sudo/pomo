import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../constants/text.dart';

@RoutePage()
class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Statistics", style: kSerzif(context)),
                const SizedBox(
                  height: 16,
                ),
                Container(

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
