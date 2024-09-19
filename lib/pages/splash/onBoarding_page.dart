import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_route/auto_route.dart';

import '../../i18n/strings.g.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: t.on_boarding.finish_button,
        finishButtonTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: kNeutralWhite) ?? TextStyle(),
        totalPage: 2,
          headerBackgroundColor: Theme.of(context).colorScheme.onSurface,
          finishButtonStyle:  FinishButtonStyle(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
          ),
          indicatorAbove: true,
          controllerColor: Theme.of(context).colorScheme.onSurface,
          background: [
            Container(
              height: MediaQuery.sizeOf(context).height,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height,
            ),
          ],
          speed: 1.8,
          pageBodies: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/images/onBoarding1.png')),
                Column(
                  children: [
                    Text(t.on_boarding.page_1.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600)
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(t.on_boarding.page_1.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/images/onBoarding2.png')),
                Column(
                  children: [
                    Text(t.on_boarding.page_2.title,
                      textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600)
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(t.on_boarding.page_2.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ],
                )
              ],
            ),
          ],
          onFinish: () async {
            var storage = await SharedPreferences.getInstance();
            await storage.setBool("is_not_first_log", true).whenComplete(
                    () => context.pushRoute(const LoginRoute()));
          },
      );
  }
}
