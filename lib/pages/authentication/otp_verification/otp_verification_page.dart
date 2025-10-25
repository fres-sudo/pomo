import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:pomo/blocs/sign_in/sign_in_bloc.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/components/widgets/toast.dart';
import 'package:pomo/constants/device.dart';
import 'package:pomo/extension/extensions.dart';
import 'package:pomo/routes/app_router.gr.dart';

@RoutePage()
class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({
    required this.email,
    super.key,
  });

  final String email;

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  int _seconds = 120;
  late Timer _timer;

  final TextEditingController _otpController = TextEditingController();
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
    _otpController.dispose();
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
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) => switch (state) {
        VerificationSuccessfulSignInState() =>
          context.router.replaceAll([const HomeRoute()]),
        VerificationFailedSignInState(error: final error) =>
          Toast.error(context, error.localizedString(context)),
        _ => null
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(Sizes.responsiveInsets(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Sizes.xl),
                      Text(
                        "Check your email".hardcoded(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: Sizes.xs),
                      Text(
                        "Enter the 6-digit code we sent to ${widget.email}"
                            .hardcoded(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                      ),
                      SizedBox(height: Sizes.xxl),
                      Pinput(
                        controller: _otpController,
                        focusNode: _focusNode,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: Theme.of(context).dividerColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 56,
                          height: 60,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: Sizes.xl),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Didn't receive the email?".hardcoded(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "You can ".hardcoded(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                ),
                                GestureDetector(
                                  onTap: () => _seconds == 0
                                      ? context
                                          .read<SignInBloc>()
                                          .email(email: widget.email)
                                      : null,
                                  child: Text(
                                    "resend".hardcoded(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: _seconds == 0
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .onSurfaceVariant,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Text(
                                  " in ".hardcoded(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                ),
                                Text(
                                  _formatTime(_seconds),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Sizes.md),
                    child: FilledButton(
                      onPressed: () {
                        if (_otpController.text.length < 6) {
                          onInvalidInput(context,
                              text: "Please enter the complete 6-digit code"
                                  .hardcoded());
                        } else {
                          context.read<SignInBloc>().verifyOtp(
                              email: widget.email, otp: _otpController.text);
                        }
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: switch (state) {
                          VerifyingEmailSignInState() => const LoadingSpinner(),
                          _ => Center(
                              child: Text(
                                "Verify Code".hardcoded(),
                              ),
                            )
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
