import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/cubits/timer/timer_cubit.dart';

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
    _currentFocusMinutes = context.read<TimerCubit>().focusTime;
    _currentBreakMinutes = context.read<TimerCubit>().breakTime;
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
            const EdgeInsets.only(top: 26, left: 16, bottom: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).bottomSheetTheme.backgroundColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.timer,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text('Set Timer Options',
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () => {
                            context
                                .read<TimerCubit>()
                                .setBreak(_currentBreakMinutes),
                        context
                            .read<TimerCubit>()
                            .setFocus(_currentFocusMinutes),
                        context.router.pop(),
                          },
                      child: Text(
                        "Update",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kPrimary500),
                      )),
                )
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
                  "Focus Time:",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Break Time:",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
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
