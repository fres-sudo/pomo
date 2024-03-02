import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/widgets/rounded_button.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../../constants/colors.dart';
import '../../../cubits/auth/auth_cubit.dart';

class LogOutBottomSheet extends StatelessWidget {
  const LogOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 4.5,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
        ],
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
      ),
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).bottomSheetTheme.backgroundColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Log Out',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 16)),
                const SizedBox(
                  height: 4,
                ),
                Text('Are you sure you want to log out this account?',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: kNeutral600)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                RoundedButton(
                  progressColor: kNeutral50,
                  borderColor: Colors.transparent,
                color: kRed500,
                  child: Text(
                    "Log Out",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: kNeutral50),
                  ),
                  onPressed: () async{
                    context.read<AuthCubit>().signOut();
                    await Future.delayed(const Duration(seconds: 1));
                    context.router.replace(const RootRoute());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
