import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomo/blocs/sign_in/sign_in_bloc.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/components/widgets/adaptive_bottom_sheet.dart';
import 'package:pomo/components/widgets/toast.dart';
import 'package:pomo/constants/assets.dart';
import 'package:pomo/constants/device.dart';
import 'package:pomo/extension/extensions.dart';
import 'package:pomo/pages/authentication/_widgets/email_login_sheet.dart';
import 'package:pomo/routes/app_router.gr.dart';

@RoutePage()
class AuthRootPage extends StatelessWidget {
  const AuthRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (BuildContext context, state) => switch (state) {
        SignedInWithAppleSignInState(user: final user) => {
            // context.read<AuthCubit>().authenticated(user),
            // if (user.username.startsWith("guest-apple"))
            //   {context.router.push(ChooseUsernameRoute(user: user))}
            // else
            //   {
            //     context.router.replaceAll([const RootRoute()]),
            //   }
          },
        SignedInWithGoogleSignInState(user: final user) => {
            // context.read<AuthCubit>().authenticated(user),
            // if (user.username.startsWith("guest-google"))
            //   {context.router.push(ChooseUsernameRoute(user: user))}
            // else
            //   {
            //     context.router.replaceAll([const RootRoute()]),
            //   }
          },
        ErrorSignInSignInState(error: final error) =>
          Toast.error(context, error.localizedString(context)),
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
                              onPressed: () =>
                                  context.router.push(const EmailLoginRoute()),
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
                    child: Image.asset(PomoAssets.loginImage)),
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
