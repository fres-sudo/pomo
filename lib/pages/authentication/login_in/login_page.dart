import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomo/blocs/sign_in/sign_in_bloc.dart';
import 'package:pomo/components/fields/email_field.dart';
import 'package:pomo/components/fields/password_field.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/components/widgets/or_separator.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../../components/widgets/alert.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (BuildContext context, state) => state.whenOrNull(
          signedInWithGoogle: (user) => {
                context.read<AuthCubit>().authenticated(user),
                if (user.username.startsWith("guest-google"))
                  {context.router.push(ChooseUsernameRoute(user: user))}
                else
                  {
                    context.router.replace(const RootRoute()),
                  }
              },
          signedInWithApple: (user) => {
                context.read<AuthCubit>().authenticated(user),
                if (user.username.startsWith("guest-apple"))
                  {context.router.push(ChooseUsernameRoute(user: user))}
                else
                  {
                    context.router.replace(const RootRoute()),
                  }
              },
          signedIn: (user) => {
                context.read<AuthCubit>().authenticated(user),
                context.router.replace(const RootRoute()),
              }),
      builder: (BuildContext context, SignInState state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                        height: MediaQuery.sizeOf(context).height / 4,
                        decoration: const BoxDecoration(
                          gradient: kGradientPurple2,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${t.authentication.login.welcome} 🍅", style: kSerzif(context)),
                          Gap.XS,
                          Text(t.authentication.login.description,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer)),
                        ],
                      ),
                    )
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16, top: 36),
                    child: Column(
                      children: [
                        Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("Email", style: Theme.of(context).textTheme.titleMedium),
                          Gap.SM,
                          EmailField(controller: _emailTextController),
                          Gap.SM,
                          Text("Password", style: Theme.of(context).textTheme.titleMedium),
                          Gap.SM,
                          PasswordField(controller: _passwordTextController),
                          Gap.SM,
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => context.pushRoute(const ForgotPasswordRoute()),
                              child: Text(
                                t.authentication.login.forgot_password,
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: kPrimary500),
                              ),
                            ),
                          ),
                          Gap.SM,
                          state.maybeWhen(
                              errorSignIn: (error) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CustomAlert.error(message: error.localizedString(context)),
                              ),
                              orElse: () => const SizedBox()),
                          Gap.SM,
                        ]),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _formKey.currentState!.validate()
                                    ? context.read<SignInBloc>().perform(email: _emailTextController.text, password: _passwordTextController.text)
                                    : onInvalidInput(context);
                              },
                              child: state.maybeWhen(
                                signingIn: () => const CustomCircularProgressIndicator(),
                                orElse: () => Center(
                                  child: Text(
                                    t.authentication.login.title,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14, color: kNeutral100),
                                  ),
                                ),
                              ),
                            ),
                            Gap.MD,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  t.authentication.login.dont_have_an_account,
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Gap.XS_H,
                                GestureDetector(
                                  onTap: () => context.pushRoute(const SignUpRoute()),
                                  child: Text(
                                    t.authentication.signup.title,
                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap.MD,
                        const OrSeparator(),
                        Gap.MD,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextButton(
                              onPressed: () => context.read<SignInBloc>().google(),
                              style:
                                  TextButton.styleFrom(side: BorderSide(color: Theme.of(context).dividerColor), backgroundColor: Colors.transparent),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/google-logo.svg",
                                    width: 19,
                                    height: 19,
                                  ),
                                  Gap.SM_H,
                                  Text(
                                    t.authentication.login.google,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                                  )
                                ],
                              )),
                        ),
                        if (false)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextButton(
                                onPressed: () => context.read<SignInBloc>().apple(),
                                style: TextButton.styleFrom(
                                    side: BorderSide(color: Theme.of(context).dividerColor), backgroundColor: Colors.transparent),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/apple-logo.svg",
                                      width: 19,
                                      height: 19,
                                    ),
                                    Gap.SM_H,
                                    Text(
                                      t.authentication.login.apple,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                                    )
                                  ],
                                )),
                          ),
                      ],
                    ),
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
