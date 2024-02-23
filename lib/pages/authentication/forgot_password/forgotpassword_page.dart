import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/widgets/rounded_button.dart';
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_otp_page.dart';

import '../../../components/fields/email_text_field.dart';
import '../../../constants/colors.dart';
import '../../../constants/text.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.chevron_left_rounded),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Reset Your Password",
                        style: Theme.of(context).textTheme.headlineMedium
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Renew your access with a password reset – safeguarding your account with simplicity and peace of mind",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Email",
                    style: Theme.of(context).textTheme.titleMedium
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  EmailField(controller: _emailTextController),
                  const SizedBox(
                    height: 28,
                  ),
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
                          ForgotPasswordOTPPage(email: _emailTextController.text),
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
