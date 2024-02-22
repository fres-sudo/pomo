import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../constants/text.dart';

@RoutePage()
class QuickSessionPage extends StatelessWidget {
  const QuickSessionPage({super.key});

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
                Text("Quick Session", style: kSerzif(context)),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
