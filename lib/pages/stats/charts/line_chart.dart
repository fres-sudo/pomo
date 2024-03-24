import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../logic/stats_brain.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({super.key, required this.brain});

  final StatsBrain brain;

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            'Weekly Productivity Average',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer)
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
            "${widget.brain.getTasksOfTheWeek()} Tasks",
            style: Theme.of(context).textTheme.displayMedium
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          //height: MediaQuery.sizeOf(context).height / 4,
          child: LineChart(
              mainData(),
            ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mon", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 10, color: Theme.of(context).colorScheme.onSecondaryContainer),),
              Text("Tue", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 10, color: Theme.of(context).colorScheme.onSecondaryContainer),),
              Text("Wed", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 10, color: Theme.of(context).colorScheme.onSecondaryContainer),),
              Text("Thu", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 10, color: Theme.of(context).colorScheme.onSecondaryContainer),),
              Text("Fri", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 10, color: Theme.of(context).colorScheme.onSecondaryContainer),),
              Text("Sat", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 10, color: Theme.of(context).colorScheme.onSecondaryContainer),),
              Text("Sun", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 10, color: Theme.of(context).colorScheme.onSecondaryContainer),),
            ],
          ),
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
      maxY: widget.brain.getAllTasksAll().toDouble(),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, widget.brain.getTaskOfMonday()),
            FlSpot(1, widget.brain.getTaskOfTuesday()),
            FlSpot(2, widget.brain.getTaskOfWednesday()),
            FlSpot(3, widget.brain.getTaskOfThursday()),
            FlSpot(4, widget.brain.getTaskOfFriday()),
            FlSpot(5, widget.brain.getTaskOfSaturday()),
            FlSpot(6, widget.brain.getTaskOfSunday()),
          ],
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
              colors: [Theme.of(context).primaryColor,Colors.transparent],
            )
          ),
        ),
      ],
    );
  }

}