import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../models/task/task.dart';

@RoutePage()
class WorkSessionPage extends StatefulWidget {
  const WorkSessionPage({super.key, required this.task});

  final Task task;

  @override
  State<WorkSessionPage> createState() => _WorkSessionPageState();
}

class _WorkSessionPageState extends State<WorkSessionPage> {
  var selectedMode = [true, false];

  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/arrow-left.svg',
                      colorFilter: ColorFilter.mode(
                          context.isDarkMode ? Colors.white : kNeutral900,
                          BlendMode.srcIn),
                    ),
                  ),
                  Text(
                    "Work Session",
                    style: kSerzif(context),
                  ),
                ]),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.isDarkMode ? kNeutral800 : kNeutral200),
                  child: ToggleButtons(
                      renderBorder: false,
                      splashColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      focusColor: Colors.transparent,
                      selectedColor: Colors.transparent,
                      fillColor: Colors.transparent,
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0;
                              buttonIndex < selectedMode.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              selectedMode[buttonIndex] = true;
                            } else {
                              selectedMode[buttonIndex] = false;
                            }
                          }
                        });
                      },
                      isSelected: selectedMode,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1 / 2 - 32,
                          decoration: BoxDecoration(
                              color: context.isDarkMode
                                  ? (selectedMode[0] ? Colors.black : kNeutral800)
                                  : (selectedMode[0]
                                      ? Colors.white
                                      : kNeutral200),
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          child: Center(
                            child: Text(
                              "Timer",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: selectedMode[0]
                                      ? kPrimary500
                                      : kNeutral600),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1 / 2 - 32,
                          decoration: BoxDecoration(
                              color: context.isDarkMode
                                  ? (selectedMode[1] ? Colors.black : kNeutral800)
                                  : (selectedMode[1]
                                      ? Colors.white
                                      : kNeutral200),
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          child: Center(
                            child: Text(
                              "Break",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: selectedMode[1]
                                      ? kPrimary500
                                      : kNeutral600),
                            ),
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 120,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode
                              ? kPrimary100.withOpacity(50)
                              : kPrimary100,
                          boxShadow: const [
                            BoxShadow(
                              color: kPrimary400,
                              spreadRadius: 1,
                              blurRadius: 100,
                            ),
                          ],
                        ),
                        height: MediaQuery.sizeOf(context).height / 3,
                        padding: const EdgeInsets.all(18.5),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height / 3 - 37,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimary300,
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height / 3 - (37 * 2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimary900,
                        ),
                        child: CircularCountDownTimer(
                          duration: 25*60,
                          initialDuration: 0,
                          controller: _controller,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
                          ringColor: kPrimary300,
                          ringGradient: LinearGradient(
                            colors: [kPrimary900, kPrimary300],
                          ),
                          fillColor: kPrimary900,
                          fillGradient: RadialGradient(
                            radius: 10 ,
                            colors: [kPrimary900, kPrimary300],
                          ),
                          backgroundColor: kPrimary900,
                          backgroundGradient: null,
                          strokeWidth: 10.0,
                          strokeCap: StrokeCap.round,
                          textStyle: GoogleFonts.inter(
                              fontSize: 33.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                          ),
                          textFormat: CountdownTextFormat.S,
                          isReverse: true,
                          isReverseAnimation: true,
                          isTimerTextShown: true,
                          autoStart: false,
                          onStart: () {
                            print('Countdown Started');
                          },
                          onComplete: () {
                            print('Countdown Ended');
                          },
                          onChange: (String timeStamp) {
                            print('Countdown Changed $timeStamp');
                          },
                          timeFormatterFunction:
                              (defaultFormatterFunction, duration) {
                              return Function.apply(
                                  defaultFormatterFunction, [duration]);
                            },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => _controller.start(),
                  //icon: Icon(Icons.start_rounded),
                  child: SvgPicture.asset("assets/icons/play-bold.svg"),
                ),
                InkWell(
                  onTap: () => _controller.pause(),
                  //icon: Icon(Icons.stop_rounded),
                  child: SvgPicture.asset("assets/icons/pause-bold.svg"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
