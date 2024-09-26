import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/auth/auth_cubit.dart';
import '../fancy_shimmer/fancy_shimmer_image.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key, this.height = 40, this.width = 40});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return context.watch<AuthCubit>().state.maybeWhen(
        authenticated: (user) {
          if (user.avatar == null) {
            return  CircleAvatar(
              radius: width / 2,
              backgroundImage: const AssetImage(
                  "assets/images/propic-placeholder.jpg"),
            );
          } else {
            return ClipOval(
                child: SizedBox(
                    height: height,
                    width: width,
                    child: FancyShimmerImage(
                      imageUrl: user.avatar!,
                      boxFit: BoxFit.cover,
                    )));
          }
        },
        orElse: () => const CircleAvatar(
          backgroundImage: AssetImage(
              "assets/images/propic-placeholder.jpg"),
        ));
  }
}
