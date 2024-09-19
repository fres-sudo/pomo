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
  final bool _obscureText = false;

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
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (BuildContext context, state) => state.whenOrNull(
        errorSignUp: () => onErrorState(context, "signing up"),
        signedUp: (_) => {context.router.replace(const RootRoute()), onSuccessState(context, "created your account")},
      ),
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
                            const SizedBox(
                              height: 6,
                            ),
                            NameField(controller: _usernameTextController, text: "username"),
                            const SizedBox(
                              height: 18,
                            ),
                            Text("Email", style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(
                              height: 6,
                            ),
                            EmailField(controller: _emailTextController),
                            const SizedBox(
                              height: 18,
                            ),
                            Text("Password", style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(
                              height: 6,
                            ),
                            PasswordField(controller: _passwordTextController),
                            const SizedBox(
                              height: 24,
                            ),
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
                                          onTap: () => context.router.push(const PrivacyPolicyRoute()),
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
                            Gap.MD,
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate() && _checkedValue) {
                                    context.read<SignUpBloc>().perform(
                                        username: _usernameTextController.text,
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text,
                                        confirmPassword: _passwordTextController.text);
                                  } else if (!_checkedValue) {
                                    onAcceptTermsCondition(context);
                                  } else {
                                    onInvalidInput(context);
                                  }
                                },
                                child: state.maybeWhen(
                                    signingUp: () => const CustomCircularProgressIndicator(),
                                    orElse: () => Center(
                                          child: Text(
                                            t.authentication.login.title,
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
