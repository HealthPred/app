import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/models/models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.chartData,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<Pair> chartData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: ksecondaryDark,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              borderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                minorGridLines: const MinorGridLines(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                labelStyle: const TextStyle(fontSize: 14, fontFamily: 'Sora'),
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: const MajorGridLines(width: 0),
                minorGridLines: const MinorGridLines(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                minorTickLines: const MinorTickLines(width: 0),
                labelStyle: const TextStyle(fontSize: 14, fontFamily: 'Sora'),
              ),
              series: <ColumnSeries<Pair, String>>[
                ColumnSeries<Pair, String>(
                  borderRadius: BorderRadius.circular(25),
                  dataSource: chartData,
                  xValueMapper: (Pair bp, _) => bp.text,
                  yValueMapper: (Pair bp, _) => bp.value,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(fontSize: 14, fontFamily: 'Sora')),
                  color: kfloro,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
