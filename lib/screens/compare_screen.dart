import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/widgets/chart.dart';
import 'package:healthpred/models/models.dart';

class CompareScreen extends StatelessWidget {
  final List<List<Pair>> chartData;
  final List<String> titles;
  const CompareScreen(
      {super.key, required this.chartData, required this.titles});

  @override
  Widget build(BuildContext context) {
    //Initialize the data source.

    return Scaffold(
        backgroundColor: kprimaryDark,
        body: Container(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 60, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  color: ksecondaryDark,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 29,
              ),

              //Description here
              const Text(
                'Compare Results',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(
                height: 40,
              ),

              //Charts
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: ((context, index) {
                    return Chart(
                      title: titles[index],
                      chartData: chartData[index],
                    );
                  }),
                  itemCount: chartData.length,
                ),
              ),
            ],
          ),
        ));
  }
}
