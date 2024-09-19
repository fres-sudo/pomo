import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/routes/app_router.gr.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../components/widgets/rounded_button.dart';
import '../../../constants/colors.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';

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

  final TextEditingController _otpEditingController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
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
    _otpEditingController.dispose();
    _focusNode.dispose();
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
                    t.authentication.forgot_password.secure_access,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)
                  ),
                  Gap.XS,
                  Text(
                    t.authentication.forgot_password.description_reset,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).dividerColor)
                  ),
                  Gap.XL,
                  Pinput(
                      controller: _otpEditingController,
                      focusNode: _focusNode,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.done,
                      length: 6,
                      cursor: Container(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Theme.of(context).dividerColor),
                            borderRadius: BorderRadius.circular(12)),
                      )),
                  //onCompleted: (pin) => pin == context.read<UserBloc>().otp ? context.router.push(const ForgotPasswordRecoverRoute()) : onOTPInvalid(context)
                  Gap.XL,
                   Center(
                     child: Column(
                      children: [
                        Text(t.authentication.forgot_password.dont_recive_email, style: Theme.of(context).textTheme.bodyMedium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${t.authentication.forgot_password.you_can} ",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {}, //_seconds == 0 ? context.read<UserBloc>().forgotPassword(email: widget.email) : null,
                              child: Text(
                                t.authentication.forgot_password.resend,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: _seconds == 0
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).dividerColor,
                                ),
                              ),
                            ),
                            Text(
                              " in ",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                            Text(
                               _formatTime(_seconds),
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                            Text(
                              " ${t.authentication.forgot_password.seconds}.",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                          ],
                        )
                      ],
                     ),
                   )
                ],
              ),

            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () => context.router.push(const ForgotPasswordRecoverRoute()),
                  child: Center(child: Text(t.general.continue_title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kNeutralWhite),))),
            ),
          ],
        ),
      ),
    );
  }
}
