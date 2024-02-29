import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:pomo/routes/app_router.gr.dart';
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

  final CountDownController _timerController = CountDownController();
  final CountDownController _breakController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(children: [
                    InkWell(
                      onTap: () {
                        AutoRouter.of(context).pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/arrow-left.svg',
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).iconTheme.color ?? Colors.white,
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
                        color: Theme.of(context).cardColor),
                    child: ToggleButtons(
                        renderBorder: false,
                        splashColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        focusColor: Colors.transparent,
                        selectedColor: Colors.transparent,
                        fillColor: Colors.transparent,
                        onPressed: (int index) {
                          setState(() {
                            for (int buttonIndex = 0; buttonIndex < selectedMode.length; buttonIndex++) {
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
                                color: selectedMode[0] ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).cardColor,
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
                                        : Theme.of(context).colorScheme.onSecondaryContainer),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1 / 2 - 32,
                            decoration: BoxDecoration(
                                color: selectedMode[1] ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).cardColor,
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
                                        : Theme.of(context).colorScheme.onSecondaryContainer),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              selectedMode[0] ?
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimary100,
                      boxShadow: [
                        BoxShadow(
                          color: kPrimary400.withOpacity(0.5),
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
                    height:
                    MediaQuery.sizeOf(context).height / 3 - (37 * 2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimary900,
                    ),
                    child: CircularCountDownTimer(
                      duration: 5,
                      initialDuration: 0,
                      controller: _timerController,
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 2,
                      ringColor: kPrimary300,
                      fillColor: kPrimary900,
                      fillGradient: const RadialGradient(
                        radius: 10,
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
                        setState(() {
                          selectedMode = [false, true];
                        });
                      },
                      timeFormatterFunction: (defaultFormatterFunction, Duration duration) {
                        // Custom time formatter function
                        int minutes = duration.inMinutes;
                        int seconds = duration.inSeconds.remainder(60);
                        return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
                      },
                    ),
                  ),
                ],
              )
                  : Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kGreen200,
                      boxShadow: [
                        BoxShadow(
                          color: kGreen200.withOpacity(0.51),
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
                      color: kGreen400,
                    ),
                  ),
                  Container(
                    height:
                    MediaQuery.sizeOf(context).height / 3 - (37 * 2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kGreen600,
                    ),
                    child: CircularCountDownTimer(
                      duration: 5 * 60,
                      initialDuration: 0,
                      controller: _breakController,
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 2,
                      ringColor: kGreen400,
                      fillColor: kGreen600,
                      fillGradient: const RadialGradient(
                        radius: 10,
                        colors: [kGreen600, kGreen400],
                      ),
                      backgroundColor: kGreen600,
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
                        setState(() {
                          selectedMode = [true, false];
                        });
                      },
                      timeFormatterFunction: (defaultFormatterFunction, Duration duration) {
                        // Custom time formatter function
                        int minutes = duration.inMinutes;
                        int seconds = duration.inSeconds.remainder(60);
                        return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  _timerController.isStarted ?
                  Center(
                    child: InkWell(
                        onTap: () => _timerController.pause(),
                        //icon: Icon(Icons.stop_rounded),
                        child: Icon(Icons.pause_circle_filled_rounded, color: Theme.of(context).iconTheme.color,size: 70,)
                    ),
                  ) :
                  Center(
                    child: InkWell(
                      onTap: () => _timerController.isPaused ? _timerController.resume() : _timerController.start(),
                      //icon: Icon(Icons.start_rounded),
                      child: Icon(Icons.play_circle_fill_rounded,color: Theme.of(context).iconTheme.color, size: 70,)
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () => AutoRouter.of(context).push(const SessionCompleteRoute()),
                      //icon: Icon(Icons.start_rounded),
                      child: Icon(Icons.gif_outlined,color: Theme.of(context).iconTheme.color, size: 70,)
                    ),
                  ),

                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.task.name.capitalize(),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.task.pomodoro * 30} min",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: kNeutral600),
                        ),
                      ],
                    ),
                    Text(
                      "1/${widget.task.pomodoro}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: kPrimary500),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
