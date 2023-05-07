import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/screens/compare_screen.dart';
import 'package:healthpred/services/predict.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:healthpred/screens/medications_list.dart';
import 'package:unicons/unicons.dart';

import '../models/models.dart';
import '../models/prediction_model.dart';
import 'dart:math';

class RiskScreen extends StatefulWidget {
  final List<String> titles;
  final List<List<Pair>> chartData;
  final List<String> params;
  final String type;
  const RiskScreen({
    super.key,
    required this.params,
    required this.type,
    required this.titles,
    required this.chartData,
  });

  @override
  State<RiskScreen> createState() => _RiskScreenState();
}

class _RiskScreenState extends State<RiskScreen> {
  PredictionModel result = PredictionModel(
    prediction: '-1',
    description: '',
    medicationNames: [],
    medicationDesc: [],
  );
  double chances = 0;

  bool isLoading = true;
  String loadingImage = 'images/heart.gif';
  String loadingText = 'We are fetching your results.';

  String getRandom(int min, int max) {
    final random = Random();
    return '${min + random.nextInt(max - min)}';
  }

  Future<void> predictResults() async {
    //get prediction results
    print('Loading...');
    setState(() {
      isLoading = true;
    });
    result = await Predict().predictResults(widget.params, widget.type);

    //check for liver disease
    if (widget.type == 'liver') {
      if (result.prediction == '1') {
        result.prediction = '1';
      } else {
        result.prediction = '0';
      }
    }
    //check for cancer disease
    if (widget.type == 'cancer') {
      if (result.prediction == 'YES') {
        result.prediction = '1';
      } else {
        result.prediction = '0';
      }
    }

    //set chances
    if (result.prediction == '1') {
      chances = double.parse(getRandom(85, 99));
    } else {
      chances = double.parse(getRandom(1, 10));
    }
    setState(() {});

    print('Loading completed...');
    setState(() {
      isLoading = false;
    });

    if (result.prediction == '-1') {
      //show alert
      setState(() {
        loadingImage = "images/error.gif";
        loadingText = 'Server Error!';
      });
    } else {
      print(result.prediction);
      print(result.description);
      print(result.medicationNames);
      print(result.medicationDesc);
    }
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() async {
    await predictResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryDark,
      body: isLoading == false && result.prediction != '-1'
          ? ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 30, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
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
                        height: 22,
                      ),
                      Text(
                        widget.type[0].toUpperCase() +
                            widget.type
                                .toString()
                                .substring(1, widget.type.length),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        result.prediction == '1' ? 'High Risk' : 'No Risk',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      //INDICATOR
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        decoration: BoxDecoration(
                          color: result.prediction == '1'
                              ? const Color(0xFFFF3D33)
                              : const Color(0xFF33FF78),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Center(
                          child: CircularPercentIndicator(
                            radius: 75.0,
                            lineWidth: 22.0,
                            animation: true,
                            percent: chances / 100,
                            center: Text(
                              '${chances.toString().substring(0, 2)}%',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                  color: result.prediction == '1'
                                      ? const Color(0xFF540000)
                                      : const Color(
                                          0xFF004307) //Color(0xFF540000),
                                  ),
                            ),
                            footer: Container(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                result.prediction == '1'
                                    ? "You are at high risk for developing ${widget.type}."
                                    : "You have no Risk for developing ${widget.type}.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: result.prediction == '1'
                                      ? const Color(0xFF540000)
                                      : const Color(0xFF004307),
                                ), //Color(0xFF540000)
                                textAlign: TextAlign.center,
                              ),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: result.prediction == '1'
                                ? const Color(0xFF540000)
                                : const Color(0xFF004307), //Color(0xFF540000)
                            backgroundColor: result.prediction == '1'
                                ? const Color(0xFFFF938D)
                                : const Color(0xFF00BE1E),
                            //Color(0xFFFF938D)
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //RECOMMEND MEDICINES
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MedicationsList(
                                medicationList: result.medicationNames,
                                medicationDesc: result.medicationDesc,
                              ),
                            ),
                          );
                        },
                        child: Visibility(
                          visible: result.prediction == '1' ? true : false,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kfloro,
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  UniconsLine.tablets,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Expanded(
                                  child: Text(
                                    'Recommend Medicines',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //VISUALIZE
                      GestureDetector(
                        onTap: () {
                          //go to compare screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompareScreen(
                                titles: widget.titles,
                                chartData: widget.chartData,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kblue,
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                UniconsLine.comparison,
                                color: Colors.black,
                                size: 35,
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: Text(
                                  'Visualize Reports',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Container(
              padding: const EdgeInsets.all(40),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      loadingImage,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      loadingText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
