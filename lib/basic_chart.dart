import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'dummy_data.dart';

class BasicChart extends StatelessWidget {
  BasicChart({
    super.key,
    required this.temp,
  });
  final List<DataJson> temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries<DataJson, String>>[
              LineSeries<DataJson, String>(
                dataSource: temp,
                xValueMapper: (DataJson data, _) => data.date,
                yValueMapper: (DataJson data, _) => data.value,
              )
            ],
          ),
        ),
      ],
    );
  }
}
