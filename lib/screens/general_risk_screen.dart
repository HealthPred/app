import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/models/prediction_model.dart';
import 'package:healthpred/screens/medications_list.dart';
import 'package:healthpred/services/predict.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:unicons/unicons.dart';

class GeneralRiskScreen extends StatefulWidget {
  final List<String> params;
  const GeneralRiskScreen({super.key, required this.params});

  @override
  State<GeneralRiskScreen> createState() => _GeneralRiskScreenState();
}

class _GeneralRiskScreenState extends State<GeneralRiskScreen> {
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
    result = await Predict().predictResults(widget.params, 'diseases');

    //set chances
    chances = double.parse(getRandom(55, 75));
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
                      const Text(
                        'Predicted Disease',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        result.prediction,
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
                          color: ksecondaryDark,
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
                                color: kgreen,
                              ),
                            ),
                            footer: Container(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                "You are at high risk for developing ${result.prediction} disease.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: kgreen,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: kgreen,
                            backgroundColor: Colors.white,
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
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kfloro,
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                UniconsLine.tablets,
                                color: Colors.black,
                                size: 35,
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
                      const SizedBox(
                        height: 20,
                      ),

                      //Description
                      Text(
                        result.description,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 50,
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
