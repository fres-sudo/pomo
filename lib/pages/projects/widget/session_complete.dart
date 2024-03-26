import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:pomo/components/widgets/rounded_button.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/routes/app_router.gr.dart';

@RoutePage()
class SessionCompletePage extends StatefulWidget {
  const SessionCompletePage({super.key});

  @override
  State<SessionCompletePage> createState() => _SessionCompletePageState();
}

class _SessionCompletePageState extends State<SessionCompletePage> {
  late ConfettiController _controllerTopCenter;


  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }

  @override
  void initState() {
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _controllerTopCenter,
                  blastDirection: pi*4,
                  maxBlastForce: 0.5, // set a lower max blast force
                  minBlastForce: 0.3, // set a lower min blast force
                  emissionFrequency: 0.07,
                  numberOfParticles: 5, // a lot of particles at once
                  gravity: 0.5,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Image.asset("assets/images/trophy.png"),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Session Complete! 🎉",
                        style: kSerzif(context),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Bravo! You've navigated this digital journey\n with finesse. Take a moment to celebrate\n your accomplishments.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: kNeutral600),
                      ),],
                  ),

                  Column(
                    children: [
                      RoundedButton(
                        onPressed: () {
                          AutoRouter.of(context).push( const ProjectRoute());
                        },
                        color: Theme.of(context).colorScheme.onPrimary,
                        child: Text("Back Home",style: Theme.of(context).textTheme.titleMedium),
                      ),
                      TextButton(
                          onPressed: () {
                            _controllerTopCenter.play();
                          },
                          child: Text(
                            "Share This Moment!",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 14),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
