import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pomo/extension/sized_box_extension.dart';
import 'package:pomo/models/stats/stats.dart';

import '../../../i18n/strings.g.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({
    super.key,
    required this.stats,
  });

  final Stats stats;

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  bool showAvg = false;
  List<String> weekDays = [
    t.week_days.monday.short,
    t.week_days.tuesday.short,
    t.week_days.wednesday.short,
    t.week_days.thursday.short,
    t.week_days.friday.short,
    t.week_days.saturday.short,
    t.week_days.sunday.short
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.stats.weekly_productivity,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer)),
        Gap.XS,
        Text("${widget.stats.completedTasksOfTheWeek.fold(0, (prev, curr) => prev + curr)} ${widget.stats.completedTasksOfTheWeek.fold(0, (prev, curr) => prev + curr) > 0 ? t.tasks.plural : t.tasks.title}",
            style: Theme.of(context).textTheme.displayMedium),
        Gap.SM,
        Expanded(
          child: LineChart(
            mainData(),
          ),
        ),
        Gap.MD,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  7, (index) => Text(weekDays[index],
                      style: Theme.of(context).textTheme.titleSmall
                          ?.copyWith(fontSize: 10, color: Theme.of(context).colorScheme.onSecondaryContainer)))),
        )
      ],
    );
  }
  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 6.3,
      minY: 0,
      maxY: widget.stats.completedTasksOfTheWeek.fold(0, (prev, curr) => prev + curr).toDouble() / 2,
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(7, (index) => FlSpot(index.toDouble(), widget.stats.completedTasksOfTheWeek[index].toDouble())),
          isCurved: true,
          color: Theme.of(context).primaryColor,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: false,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Theme.of(context).primaryColor, Colors.transparent],
              )),
        ),
      ],
    );
  }
}
