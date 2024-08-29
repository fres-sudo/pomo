import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pomo/components/widgets/top_bottom_sheet_widget.dart';
import 'package:pomo/cubits/timer/timer_cubit.dart';

import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';

class SetTimer extends StatefulWidget {
  const SetTimer({super.key});

  @override
  State<SetTimer> createState() => _SetTimerState();
}

class _SetTimerState extends State<SetTimer> {
  late int _currentBreakMinutes;
  late int _currentFocusMinutes;

  @override
  void initState() {
    _currentFocusMinutes = context.read<TimerCubit>().state.focusTime;
    _currentBreakMinutes = context.read<TimerCubit>().state.breakTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height / 3,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
          ],
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
        ),
        padding:
            const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TopBottomSheetWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => {
                      context.read<TimerCubit>().resetAll(),
                      context.router.maybePop(),
                    },
                    child: Text(
                      t.general.reset,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color :Theme.of(context).colorScheme.error)
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      size: 20,
                    ),
                    Gap.XS_H,
                    Text(t.profile.settings.general.set_timer_options,
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                TextButton(
                    onPressed: () => {
                          context.read<TimerCubit>().setTimer(_currentFocusMinutes, _currentBreakMinutes),
                          context.router.maybePop(),
                        },
                    child: Text(
                      t.general.update,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).primaryColor)
                    ))
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${t.tasks.focus_time}:",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Gap.SM,
                NumberPicker(
                  value: _currentFocusMinutes,
                  minValue: 1,
                  maxValue: 60,
                  step: 1,
                  itemHeight: 60,
                  itemWidth: 75,
                  haptics: true,
                  selectedTextStyle: Theme.of(context).textTheme.titleLarge,
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  axis: Axis.horizontal,
                  onChanged: (value) =>
                      setState(() => _currentFocusMinutes = value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.transparent,
                    //backgroundBlendMode: BlendMode.screen,
                    border: Border.all(color: Colors.black26),
                  ),
                ),
              ],
            ),
            Gap.MD,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${t.tasks.break_time}:",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Gap.SM,
                NumberPicker(
                  value: _currentBreakMinutes,
                  minValue: 1,
                  maxValue: 60,
                  step: 1,
                  itemHeight: 60,
                  itemWidth: 75,
                  haptics: true,
                  selectedTextStyle: Theme.of(context).textTheme.titleLarge,
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  axis: Axis.horizontal,
                  onChanged: (value) =>
                      setState(() => _currentBreakMinutes = value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.transparent,
                    //backgroundBlendMode: BlendMode.screen,
                    border: Border.all(color: Colors.black26),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
