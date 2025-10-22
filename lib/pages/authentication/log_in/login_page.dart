import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/blocs/sign_in/sign_in_bloc.dart';
import 'package:pomo/components/fields/email_field.dart';
import 'package:pomo/components/fields/password_field.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/components/widgets/or_separator.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/constants/assets.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/device.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/cubits/theme/theme_cubit.dart';
import 'package:pomo/extension/extensions.dart';
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
      listener: (BuildContext context, state) => switch (state) {
        SignedInWithAppleSignInState(user: final user) => {
            context.read<AuthCubit>().authenticated(user),
            if (user.username.startsWith("guest-apple"))
              {context.router.push(ChooseUsernameRoute(user: user))}
            else
              {
                context.router.replaceAll([const RootRoute()]),
              }
          },
        SignedInWithGoogleSignInState(user: final user) => {
            context.read<AuthCubit>().authenticated(user),
            if (user.username.startsWith("guest-google"))
              {context.router.push(ChooseUsernameRoute(user: user))}
            else
              {
                context.router.replaceAll([const RootRoute()]),
              }
          },
        SignedInSignInState(user: final user) => {
            context.read<AuthCubit>().authenticated(user),
            context.router.replaceAll([const RootRoute()]),
          },
        _ => {}
      },
      builder: (BuildContext context, SignInState state) {
        return Scaffold(
          bottomNavigationBar: SafeArea(
            bottom: true,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Sizes.responsiveInsets(context),
                  vertical: Sizes.md),
              child: Column(
                spacing: Sizes.xs,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    spacing: Sizes.md,
                    children: [
                      Expanded(
                          child: FilledButton.tonal(
                              onPressed: () =>
                                  context.read<SignInBloc>().google(),
                              child: SvgPicture.asset(
                                PomoAssets.googleLogo,
                                width: Sizes.lg + 4,
                                height: Sizes.lg + 4,
                              ))),
                      Expanded(
                          child: FilledButton.tonal(
                              onPressed: () =>
                                  context.read<SignInBloc>().apple(),
                              child: SvgPicture.asset(
                                context.isDarkMode
                                    ? PomoAssets.appleLightLogo
                                    : PomoAssets.appleDarkLogo,
                                width: Sizes.lg + 4,
                                height: Sizes.lg + 4,
                              ))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: FilledButton(
                              onPressed: () {},
                              child: Text("Continue with Email".hardcoded()))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(Sizes.responsiveInsets(context)),
            child: Column(
              spacing: Sizes.xl,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.borderRadius),
                    child: Image.asset("assets/images/login-image.png")),
                Text("Welcome to Pomo".hardcoded(),
                    style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
          ),
        );
      },
    );
  }
}
