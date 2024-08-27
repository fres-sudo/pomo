import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../routes/app_router.gr.dart';

class CreateProjectFloatingButton extends StatelessWidget {
  const CreateProjectFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => context.router.push(const CreateProjectRoute()),
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: kPrimary500),
          child: const Icon(
            Icons.add_rounded,
            color: kNeutralWhite,
          ),
        ));
  }
}
