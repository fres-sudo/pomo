import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/recover_password/recover_password_bloc.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../../components/fields/password_field.dart';
import '../../../components/widgets/snack_bars.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';

@RoutePage()
class ForgotPasswordRecoverPage extends StatefulWidget {
  const ForgotPasswordRecoverPage({super.key, required this.email, required this.token});

  final String email;
  final String token;

  @override
  State<ForgotPasswordRecoverPage> createState() => _ForgotPasswordRecoverPageState();
}

class _ForgotPasswordRecoverPageState extends State<ForgotPasswordRecoverPage> {
  final TextEditingController _confirmPasswordTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
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
    _confirmPasswordTextController.dispose();
    _passwordTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecoverPasswordBloc, RecoverPasswordState>(
      listener: (BuildContext context, RecoverPasswordState state) => switch (state) {
        ResettedPasswordRecoverPasswordState() => context.router.replaceAll([const LoginRoute()]),
        ErrorResettingPasswordRecoverPasswordState(error: final error) => {
            onErrorState(context, error.localizedString(context)),
            context.router.replaceAll([const LoginRoute()])
          },
        _ => null,
      },
      builder: (BuildContext context, state) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 44.0, left: 16, right: 16, bottom: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.authentication.forgot_password.change_password,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    Gap.XS,
                    Text(
                      t.authentication.forgot_password.description_change_password,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Theme.of(context).dividerColor),
                    ),
                    Gap.XL,
                    Text(t.authentication.forgot_password.new_password,
                        style: Theme.of(context).textTheme.titleMedium),
                    Gap.SM,
                    PasswordField(
                      controller: _passwordTextController,
                      focusNode: _focusNode,
                    ),
                    Gap.MD,
                    Text(t.authentication.forgot_password.confirm_password,
                        style: Theme.of(context).textTheme.titleMedium),
                    Gap.XS,
                    PasswordField(controller: _confirmPasswordTextController),
                    Gap.XL,
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_passwordTextController.text !=
                                _confirmPasswordTextController.text) {
                              onDoesNotMatch(context);
                            } else {
                              context.read<RecoverPasswordBloc>().resetPassword(
                                  email: widget.email,
                                  token: widget.token,
                                  newPassword: _passwordTextController.text,
                                  confirmNewPassword: _confirmPasswordTextController.text);
                            }
                          } else {
                            onInvalidInput(context);
                          }
                        },
                        child: switch (state) {
                          ResettingPasswordRecoverPasswordState() =>
                            const CustomCircularProgressIndicator(),
                          _ => Center(
                              child: Text(
                                t.general.done,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
