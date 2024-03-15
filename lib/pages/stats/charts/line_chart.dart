import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({super.key});

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
                'Weekly Productivity Average',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer)
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
                "10 Tasks",
                style: Theme.of(context).textTheme.displayMedium
            ),
            const SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 5,
              child: LineChart(
                mainData(),
              ),
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
        )

      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        //TODO: ADD DATA
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
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