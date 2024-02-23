import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/widgets/rounded_button.dart';
import '../../../constants/colors.dart';
import '../../../constants/text.dart';
import 'forgotpassword_recover_page.dart';

@RoutePage()
class ForgotPasswordOTPPage extends StatefulWidget {
  const ForgotPasswordOTPPage({required this.email ,super.key});

  final String email;

  @override
  State<ForgotPasswordOTPPage> createState() => _ForgotPasswordOTPPageState();
}

class _ForgotPasswordOTPPageState extends State<ForgotPasswordOTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 44.0, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Secure Access in a Snap!",
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.headlineMedium
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Enter the one-time code we just sent to your device to unlock the door to your digital realm. Fast, easy, and extra secure!",
                    style: Theme.of(context).textTheme.titleMedium
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //TODO: add the otp text field
                  const SizedBox(
                    height: 40,
                  ),
                   Column(
                    children: [
                      Text("Don't recive an email yet?", style: Theme.of(context).textTheme.bodyMedium),
                      // TODO: add counter and if the counter is over highlight in primary color the text below and make it clickable
                      const Text("You can resend code in ... seconds"),
                    ],
                  )
                ],
              ),

            ),
            Expanded(
              child: Container(),
            ), // Added Expanded to take remaining space
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: RoundedButton(
                color: kPrimary500,
                borderColor: Colors.transparent,
                child: Text(
                  "Continue",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kNeutral50,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) =>
                      const ForgotPasswordRecoverPage(),
                      transitionsBuilder:
                          (c, anim, a2, child) =>
                          FadeTransition(
                              opacity: anim,
                              child: child),
                      transitionDuration:
                      const Duration(milliseconds: 300),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
