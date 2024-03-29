import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/widgets/rounded_button.dart';
import '../../../constants/colors.dart';
import '../../../routes/app_router.gr.dart';

class NoProjectView extends StatelessWidget {
  const NoProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/no-proj-image.png",
          scale: 0.85,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "You still don't have \n any project",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        RoundedButton(
          borderColor: Colors.transparent,
          color: kPrimary500,
          width: MediaQuery.sizeOf(context).width / 2.5,
          onPressed: () {
            AutoRouter.of(context)
                .push(const CreateProjectRoute());
          },
          child: Text(
            "New Project",
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kNeutral50),
          ),
        ),
      ],
    );
  }
}
