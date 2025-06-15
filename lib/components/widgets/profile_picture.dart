import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/auth/auth_cubit.dart';
import '../fancy_shimmer/fancy_shimmer_image.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key, this.height = 40, this.width = 40});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) => switch (context.watch<AuthCubit>().state) {
        AuthenticatedAuthState(:final user) => user.avatar == null
            ? CircleAvatar(
                radius: width / 2,
                backgroundImage: const AssetImage("assets/images/propic-placeholder.jpg"),
              )
            : ClipOval(
                child: SizedBox(
                    height: height,
                    width: width,
                    child: FancyShimmerImage(
                      imageUrl: user.avatar!,
                      boxFit: BoxFit.cover,
                    ))),
        _ => CircleAvatar(
            radius: width / 2,
            backgroundImage: AssetImage("assets/images/propic-placeholder.jpg"),
          )
      };
}
