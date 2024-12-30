import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/sign_up/sign_up_bloc.dart';
import 'package:pomo/components/fields/email_field.dart';
import 'package:pomo/components/fields/name_field.dart';
import 'package:pomo/components/fields/password_field.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/routes/app_router.gr.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/widgets/alert.dart';
import '../../../components/widgets/snack_bars.dart';
import '../../../constants/colors.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _checkedValue = false;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _usernameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (BuildContext context, SignUpState state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 1 / 3.5,
                      decoration: const BoxDecoration(
                          gradient: kGradientPurple2,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16, bottom: 30),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                        Text(
                          "${t.authentication.signup.title} 👋",
                          style: kSerzif(context),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(t.authentication.signup.description,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer)),
                      ]),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16, top: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Username", style: Theme.of(context).textTheme.titleMedium),
                            Gap.SM,
                            NameField(controller: _usernameTextController, hintText: "username"),
                            Gap.SM,
                            Text("Email", style: Theme.of(context).textTheme.titleMedium),
                            Gap.SM,
                            EmailField(controller: _emailTextController),
                            Gap.SM,
                            Text("Password", style: Theme.of(context).textTheme.titleMedium),
                            Gap.SM,
                            PasswordField(controller: _passwordTextController),
                            Gap.SM,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      splashRadius: 3,
                                      value: _checkedValue,
                                      onChanged: (newValue) => setState(() {
                                        _checkedValue = newValue!;
                                      }),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${t.authentication.signup.i_accept} ",
                                          style: Theme.of(context).textTheme.titleSmall,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            const url = 'https://pomo.fres.space/terms';
                                            if (await canLaunchUrl(Uri.parse(url))) {
                                              await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child: Text(
                                            t.authentication.signup.terms_and_conditions,
                                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Gap.SM,
                            const Divider(),
                            state.maybeWhen(
                                errorSignUp: (error) => Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                                  child: CustomAlert.error(message: error.localizedString(context)),
                                ),
                                signedUp: (_) => Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                                  child: CustomAlert.success(title: t.authentication.signup.success_title, message: t.authentication.signup.success),
                                ),
                                orElse: () => Gap.MD),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate() && _checkedValue) {
                                    context.read<SignUpBloc>().perform(
                                        username: _usernameTextController.text,
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text,
                                        confirmPassword: _passwordTextController.text);
                                    _formKey.currentState?.reset();
                                  } else if (!_checkedValue) {
                                    onAcceptTermsCondition(context);
                                  } else {
                                    _formKey.currentState?.reset();
                                    onInvalidInput(context);
                                  }
                                },
                                child: state.maybeWhen(
                                    signingUp: () => const CustomCircularProgressIndicator(),
                                    orElse: () => Center(
                                          child: Text(
                                            t.authentication.signup.title,
                                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kNeutralWhite),
                                          ),
                                        )))
                          ],
                        ),
                      ),
                      Gap.MD,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(t.authentication.signup.already_have_an_account, style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () => context.pushRoute(const LoginRoute()),
                            child: Text(t.authentication.login.title,
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor)),
                          )
                        ],
                      ),
                      Gap.MD,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
