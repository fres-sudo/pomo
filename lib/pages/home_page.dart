import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/routes/app_router.gr.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) => switch (state) {
        AuthenticatedAuthState(user: final user) => {
            if (user.onboardingCompletedAt == null)
              {
                context.router.replaceAll([OnBoardingRoute()])
              }
            else
              {
                context.router.replaceAll([const RootRoute()])
              }
          },
        NotAuthenticatedAuthState() =>
          context.router.replaceAll([const AuthRootRoute()]),
        _ => null,
      },
      child: Scaffold(
        backgroundColor: SolidColors.darkPink,
        body: Center(
          child: Text('Pomo',
              style: GoogleFonts.fascinate(color: SolidColors.pink)),
        ),
      ),
    );
  }
}
