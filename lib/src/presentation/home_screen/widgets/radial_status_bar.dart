import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialStatusBar extends StatelessWidget {
  const RadialStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 248,
      width: 248,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: SfCircularChart(
              margin: EdgeInsets.zero,
              series: <CircularSeries>[
                RadialBarSeries<ChartData, String>(
                  dataSource: [ChartData('David', 10500)],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  maximumValue: 11000,
                  radius: '65%',
                  innerRadius: '92%',
                  cornerStyle: CornerStyle.bothCurve,
                ),
                RadialBarSeries<ChartData, String>(
                  dataSource: [ChartData('Steve', 38)],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  maximumValue: 50,
                  radius: '55%',
                  innerRadius: '89%',
                  cornerStyle: CornerStyle.bothCurve,
                ),
              ],
            ),
          ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '10500',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '38',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
