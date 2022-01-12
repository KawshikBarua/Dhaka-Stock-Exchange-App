import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:stock_market/get/controller.dart';
import 'package:stock_market/utils/constants.dart';

class GraphDataDetailed extends StatefulWidget {
  final int param;
  const GraphDataDetailed({Key? key, required this.param}) : super(key: key);

  @override
  State<GraphDataDetailed> createState() => _GraphDataDetailedState();
}

class _GraphDataDetailedState extends State<GraphDataDetailed> {
  double prevVal = 0;
  List<double> data = [1, 2, 3, 4, 5];
  double inc = 0;
  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(Controller());
    data.add(double.parse(_controller.getposts[widget.param].value));
    return LineChart(LineChartData(
        clipData: FlClipData.all(),
        borderData: FlBorderData(
            show: true,
            border: Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(width: 1.5),
                bottom: BorderSide(width: 1.5))),
        titlesData: FlTitlesData(
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
            leftTitles: SideTitles(interval: 0.5, showTitles: true),
            bottomTitles: SideTitles(
              getTitles: (value) {
                if (value > prevVal) {
                  prevVal = value;
                  if (value == 1) {
                    return "10am";
                  } else if (value == 2) {
                    return "11am";
                  } else if (value == 3) {
                    return "12pm";
                  } else if (value == 4) {
                    return "1pm";
                  } else if (value == 5) {
                    return "2pm";
                  } else {
                    return " ";
                  }
                } else {
                  return '';
                }
              },
              showTitles: true,
            )),
        gridData: FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
              colors: double.parse(_controller.getposts[widget.param].value) >
                      prevVal
                  ? [green]
                  : [red],
              barWidth: 3,
              dotData: FlDotData(show: false),
              spots: data.map((e) {
                if (inc > 4) {
                  print('enters');
                  inc = 0;
                }
                return FlSpot(inc++, e);
              }).toList()),
        ]));
  }
}
