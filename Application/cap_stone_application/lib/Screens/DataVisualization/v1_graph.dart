import 'dart:convert';

import '../../main.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class MathaneGraph extends StatefulWidget {
  const MathaneGraph({super.key});

  @override
  State<MathaneGraph> createState() => _MathaneGraphState();
}

class _MathaneGraphState extends State<MathaneGraph> {
  List<MethaneReadings> _chartData = [];
  late TooltipBehavior _tooltipBehavior;
  bool isLoaded = false;

  Future<String> getChartData() async {
    if (!isLoaded) {
      await http.get(Uri.parse(ServerIp)).then((results) {
        var data = jsonDecode(results.body);
        double time = 0;

        for (var u in data) {
          _chartData.add(
              MethaneReadings(double.parse(u["v1"].toString()), time));
          time = time + 5;
        }
        return "";
      });
    } else {
      return "";
    }
    return "";
  }

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  void dispose() {
    isLoaded = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: getChartData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SfCartesianChart(
                  backgroundColor: Color(0xFFf7f7f2),
                  title: ChartTitle(text: 'Temperature readings'),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: _tooltipBehavior,
                  series: <LineSeries>[
                    LineSeries<MethaneReadings, double>(
                      name: 'Temperature',
                      dataSource: _chartData,
                      xValueMapper: (MethaneReadings time, _) => time.time,
                      yValueMapper: (MethaneReadings v1, _) => v1.v1,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                      enableTooltip: true,
                      color: Colors.black,
                      // width: 4,
                      opacity: 1,
                    )
                  ],
                  primaryXAxis:
                      NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                  // primaryYAxis: NumericAxis(
                  //     numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
                );
              }
            }),
      ),
    );
  }
}

class MethaneReadings {
  MethaneReadings(this.v1, this.time);
  final double v1, time;
}
