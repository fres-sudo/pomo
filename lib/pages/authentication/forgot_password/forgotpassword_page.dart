import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/recover_password/recover_password_bloc.dart';
import 'package:pomo/components/fields/email_field.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../../components/widgets/snack_bars.dart';
import '../../../constants/colors.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecoverPasswordBloc, RecoverPasswordState>(
      listener: (BuildContext context, RecoverPasswordState state) => switch (state) {
        ForgottedPasswordRecoverPasswordState() =>
          context.router.push(ForgotPasswordOTPRoute(email: _emailTextController.text)),
        ErrorForgottingPasswordRecoverPasswordState() =>
          onErrorState(context, state.error.localizedString(context)),
        _ => null,
      },
      builder: (BuildContext context, RecoverPasswordState state) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 44.0, left: 16, right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => context.router.maybePop(),
                          child: const Icon(Icons.chevron_left_rounded)),
                      Gap.XS_H,
                      Text(t.authentication.forgot_password.reset_password,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Gap.XS,
                  Text(
                    t.authentication.forgot_password.description_forgot,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Theme.of(context).dividerColor),
                  ),
                  Gap.XL,
                  Text("Email", style: Theme.of(context).textTheme.titleMedium),
                  Gap.XS,
                  EmailField(
                    controller: _emailTextController,
                    focusNode: _focusNode,
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<RecoverPasswordBloc>()
                              .forgotPassword(email: _emailTextController.text);
                        } else {
                          onInvalidInput(context);
                        }
                      },
                      child: switch (state) {
                        ForgottingPasswordRecoverPasswordState() =>
                          const CustomCircularProgressIndicator(),
                        _ => Center(
                            child: Text(t.authentication.forgot_password.send_email,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontSize: 14,
                                      color: kNeutral100,
                                    )))
                      }),
                  Gap.SM,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
