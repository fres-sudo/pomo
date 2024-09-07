import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/extension/sized_box_extension.dart';

import '../../../i18n/strings.g.dart';
import '../../../models/stats/stats.dart';
import '../../../models/task/task.dart';

class CustomBarChart extends StatefulWidget {
  const CustomBarChart(
      {super.key, required this.barBackgroundColor, required this.barColor, required this.touchedBarColor, required this.tasks, required this.stats});

  final Stats stats;
  final Color barBackgroundColor;
  final Color barColor;
  final Color touchedBarColor;
  final List<Task> tasks;

  @override
  State<StatefulWidget> createState() => CustomBarChartState();
}

class CustomBarChartState extends State<CustomBarChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

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

  @override
  Widget build(BuildContext context) {
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
              Text("${widget.tasks.isEmpty ? "0" : widget.stats.completionPercentage}%", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
              Gap.SM,
              Expanded(
                child: BarChart(
                  mainBarData(),
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
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 10,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched ? BorderSide(color: widget.touchedBarColor.darken(80)) : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.barBackgroundColor.withOpacity(0.1),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() =>
      List.generate(7, (i) => makeGroupData(0, widget.stats.completedTasksOfTheWeek[i].toDouble(), isTouched: i == touchedIndex));

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay = weekDaysLong[group.x];
            return BarTooltipItem(
              '$weekDay\n',
              Theme.of(context).textTheme.titleSmall!,
              children: [
                TextSpan(text: (rod.toY - 1).toString(), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: kPrimary500)),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions || barTouchResponse == null || barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
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
            getTitlesWidget: getTitles,
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
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = Theme.of(context).textTheme.titleSmall?.copyWith(
        fontSize: 10, color: DateTime.now().day == value ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSecondaryContainer);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(weekDaysShort[value.toInt()], style: style),
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) => makeGroupData(i, Random().nextInt(15).toDouble() + 6, barColor: Theme.of(context).primaryColor)),
      gridData: const FlGridData(show: false),
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
