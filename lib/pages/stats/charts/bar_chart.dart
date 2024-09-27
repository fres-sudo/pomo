import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/extension/sized_box_extension.dart';

import '../../../constants/colors.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/stats/stats.dart';

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({super.key, required this.barBackgroundColor, required this.barColor, required this.touchedBarColor, required this.stats});

  final Stats stats;
  final Color barBackgroundColor;
  final Color barColor;
  final Color touchedBarColor;

  @override
  State<StatefulWidget> createState() => CustomBarChartState();
}

class CustomBarChartState extends State<CustomBarChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;



  @override
  Widget build(BuildContext context) {

    List<String> weekDaysShort = [
      t.week_days.monday.short,
      t.week_days.tuesday.short,
      t.week_days.wednesday.short,
      t.week_days.thursday.short,
      t.week_days.friday.short,
      t.week_days.saturday.short,
      t.week_days.sunday.short
    ];

    List<String> weekDaysLong = [
      t.week_days.monday.long,
      t.week_days.tuesday.long,
      t.week_days.wednesday.long,
      t.week_days.thursday.long,
      t.week_days.friday.long,
      t.week_days.saturday.long,
      t.week_days.sunday.long,
    ];

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(t.stats.weekly_focus,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer)),
              Gap.XS,
              Text("${widget.stats.completionPercentage.toStringAsFixed(2)}%",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
              Gap.SM,
              Expanded(
                child: BarChart(
                    BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                            tooltipHorizontalAlignment: FLHorizontalAlignment.right,
                            tooltipMargin: -10,
                            getTooltipColor: (_) => Theme.of(context).colorScheme.primaryContainer,
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              // Get both completed and uncompleted tasks for the selected group (day)
                              double completedTasks = widget.stats.completedTasksOfTheWeek[groupIndex].toDouble();
                              double uncompletedTasks = widget.stats.uncompletedTasksOfTheWeek[groupIndex].toDouble();

                              String weekDay = weekDaysLong[groupIndex];

                              return BarTooltipItem(
                                '$weekDay\n',
                                Theme.of(context).textTheme.titleSmall!,
                                textAlign: TextAlign.start,
                                children: [
                                  TextSpan(
                                    text: '${t.general.completed}: ${completedTasks.round()}\n',
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  TextSpan(
                                    text: '${t.general.uncompleted}: ${uncompletedTasks.round()}',
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              );
                            }
                        ),
                        touchCallback: (FlTouchEvent event, barTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions || barTouchResponse == null || barTouchResponse.spot == null) {
                              touchedIndex = -1;
                              return;
                            }

                            // Get the touched bar index (day)
                            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                          });
                        },
                      ),

                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) => getTitles(value, meta, weekDaysShort),
                            reservedSize: 38,
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingGroups(),
                      gridData: const FlGridData(show: false),
                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double completedTasks,
    double uncompletedTasks, {
    bool isTouched = false,
    Color? completedBarColor,
    Color? uncompletedBarColor,
    double width = 10,
    List<int> showTooltips = const [],
  }) {
    completedBarColor ??= widget.barColor;
    uncompletedBarColor ??= kPrimary200;

    return BarChartGroupData(
      x: x,
      barRods: [
        // Uncompleted tasks rod
        BarChartRodData(
          toY: isTouched ? uncompletedTasks + 1 : uncompletedTasks,
          color: uncompletedBarColor,
          width: width,
          borderSide: isTouched ? BorderSide(color: uncompletedBarColor.darken(80)) : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 10,
            color: widget.barBackgroundColor.withOpacity(0.1),
          ),
        ),
        // Completed tasks rod
        BarChartRodData(
          toY: isTouched ? completedTasks + 1 : completedTasks,
          color: completedBarColor,
          width: width,
          borderSide: isTouched ? BorderSide(color: completedBarColor.darken(80)) : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 10,
            color: widget.barBackgroundColor.withOpacity(0.1),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(
      7,
      (i) => makeGroupData(i, widget.stats.completedTasksOfTheWeek[i].toDouble(), widget.stats.uncompletedTasksOfTheWeek[i].toDouble(),
          isTouched: i == touchedIndex));

  Widget getTitles(double value, TitleMeta meta, List<String> weekDaysShort) {
    final style = Theme.of(context).textTheme.titleSmall?.copyWith(
        fontSize: 10, color: DateTime.now().day == value ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSecondaryContainer);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(weekDaysShort[value.toInt()], style: style),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}
