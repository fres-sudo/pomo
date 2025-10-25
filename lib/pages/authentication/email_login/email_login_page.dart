import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/sign_in/sign_in_bloc.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/components/widgets/header_bottom_sheet.dart';
import 'package:pomo/components/widgets/toast.dart';
import 'package:pomo/constants/device.dart';
import 'package:pomo/extension/extensions.dart';
import 'package:pomo/routes/app_router.gr.dart';

@RoutePage()
class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) => switch (state) {
        SignedInSignInState(email: final email) => {
            context.router.push(OtpVerificationRoute(email: email)),
          },
        ErrorSignInSignInState(error: final error) =>
          Toast.error(context, error.localizedString(context)),
        _ => {}
      },
      child: Material(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: Sizes.responsiveInsets(context),
              right: Sizes.responsiveInsets(context),
              top: Sizes.responsiveInsets(context),
              bottom: Sizes.responsiveInsets(context) +
                  MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Sizes.md),
                HeaderBottomSheet(
                  title: "Continue With Email".hardcoded(),
                  subtitle: "We'll send you an OTP code to access your account"
                      .hardcoded(),
                ),
                SizedBox(height: Sizes.md),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email".hardcoded(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                ),
                SizedBox(height: Sizes.lg),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    return FilledButton(
                        onPressed: state is SigningInSignInState
                            ? null
                            : () => context
                                .read<SignInBloc>()
                                .email(email: _emailController.text),
                        child: switch (state) {
                          SigningInSignInState() => const LoadingSpinner(),
                          _ => Text("Send Email".hardcoded()),
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
