import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: "I'm ready",
        finishButtonTextStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: kNeutral50
        ),
        totalPage: 2,
          //pageBackgroundColor: kNeutralBackground,
          headerBackgroundColor: kNeutral900,
          finishButtonStyle:  FinishButtonStyle(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
          ),
          indicatorAbove: true,
          controllerColor: kNeutral900,
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
                    Text('Manage your time \n as you wish!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text('Smart and customizable timer that helps \n you manage your time more effectively.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
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
                    Text('Efficient Task Management \n Made Easy',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text('Plan your day, set reminders, and track your \n progress with our intuitive timer app that \n helps you achieve your goals.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
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
