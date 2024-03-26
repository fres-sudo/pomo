import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/widgets/rounded_button.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../../constants/colors.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700)
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Renew your access with a password reset – safeguarding your account with simplicity and peace of mind",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).dividerColor),
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
                  Form(child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextController,
                    cursorColor: kPrimary600,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[ ]')),
                    ],
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !EmailValidator.validate(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  )),

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
                color: Theme.of(context).primaryColor,
                borderColor: Colors.transparent,
                child: Text(
                  "Send Email",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kNeutral50,
                  ),
                ),
                onPressed: () {
                  EmailValidator.validate(_emailTextController.text) ? context.router.push( ForgotPasswordOTPRoute(email: _emailTextController.text)) : onInvalidInput(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
