import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:stock_market/get/controller.dart';
import 'package:stock_market/utils/constants.dart';

class GraphData extends StatefulWidget {
  final int param;
  const GraphData({Key? key, required this.param}) : super(key: key);

  @override
  State<GraphData> createState() => _GraphDataState();
}

class _GraphDataState extends State<GraphData> {
  double prevVal = 0;
  List<double> data = [];
  double inc = 0;
  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(Controller());
    print(data);
    data.add(double.parse(_controller.getposts[widget.param].value));
    return LineChart(LineChartData(
        lineTouchData: LineTouchData(enabled: false),
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
            leftTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: false,
            )),
        gridData: FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
              belowBarData: BarAreaData(
                  show: true,
                  colors: [green, white],
                  gradientFrom: Offset(2, 4),
                  gradientTo: Offset(0, 5)),
              colors: double.parse(_controller.getposts[widget.param].value) >
                      prevVal
                  ? [green]
                  : [red],
              barWidth: 4,
              dotData: FlDotData(show: false),
              spots: data.map((e) {
                if (inc > 4) {
                  inc = 0;
                }
                return FlSpot(inc++, e);
              }).toList()),
        ]));
  }
}
