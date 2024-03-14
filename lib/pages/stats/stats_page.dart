import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../components/widgets/rounded_button.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';

@RoutePage()
class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Statistics", style: kSerzif(context))),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  children: [
                    ToggleButtons(isSelected: [], children: [])
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
