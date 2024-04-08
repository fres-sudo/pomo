import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/routes/app_router.gr.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../components/widgets/rounded_button.dart';
import '../../../constants/colors.dart';

@RoutePage()
class ForgotPasswordOTPPage extends StatefulWidget {
  const ForgotPasswordOTPPage({required this.email ,super.key,});

  final String email;

  @override
  State<ForgotPasswordOTPPage> createState() => _ForgotPasswordOTPPageState();
}

class _ForgotPasswordOTPPageState extends State<ForgotPasswordOTPPage> {

  int _seconds = 120;
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
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
                  Text(
                    "Secure Access in a Snap!",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Enter the one-time code we just sent to your device to unlock the door to your digital realm. Fast, easy, and extra secure!",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).dividerColor)
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  OtpTextField(
                    numberOfFields: 6,
                    showFieldAsBox: true,
                    //fillColor: Theme.of(context).cardColor,
                    //filled: false,
                    onCodeChanged: (String code) {
                      print(code);
                    },
                    //borderColor: Colors.transparent,
                    //disabledBorderColor: Colors.transparent,
                    //enabledBorderColor: Theme.of(context).primaryColor,
                    //inputFormatters: [
                    //  FilteringTextInputFormatter.allow(digitsOnlyRegex),
                    //],
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(16),
                    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 50),
                    onSubmit: (String verificationCode){
                      verificationCode == context.read<UserBloc>().otp ? context.router.push(const ForgotPasswordRecoverRoute()) : null;
                    }, // end onSubmit
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                   Center(
                     child: Column(
                      children: [
                        Text("Don't recive an email yet?", style: Theme.of(context).textTheme.bodyMedium),
                        RichText(
                          text: TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: "You can ",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<UserBloc>().forgotPassword(email: widget.email);
                                  },
                                  child: Text(
                                    "resend code",
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: _seconds == 0
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).dividerColor,
                                    ),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " in ",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                              TextSpan(
                                text: _formatTime(_seconds),
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                              TextSpan(
                                text: " seconds.",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                     ),
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
                  context.router.push(const ForgotPasswordRecoverRoute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
