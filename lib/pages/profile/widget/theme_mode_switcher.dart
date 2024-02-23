import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/cubits/theme/theme_cubit.dart';

class ThemeModeSwitcher extends StatelessWidget {
  const ThemeModeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.sizeOf(context).height/3,
          padding: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
            ],
          ),
          child: Column(
            children: ThemeMode.values
                .map(
                  (mode) => RadioListTile<ThemeMode>(
                  value: mode,
                  title: Text(
                      '${mode.name[0].toUpperCase()}${mode.name.substring(1).toLowerCase()}'),
                  groupValue: state.mode,
                  onChanged: (value) {
                    context.read<ThemeCubit>().changeMode(value);
                    context.router.pop();
                  }),
            )
                .toList(growable: false),
          ),
        );
      },
    );
  }
}
