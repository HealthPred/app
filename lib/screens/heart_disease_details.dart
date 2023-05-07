import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/screens/risk_screen.dart';
import 'package:healthpred/widgets/textbox.dart';
import 'package:healthpred/widgets/text_head.dart';

import '../models/models.dart';

class HeartDiseaseDetails extends StatefulWidget {
  const HeartDiseaseDetails({super.key});

  @override
  State<HeartDiseaseDetails> createState() => _HeartDiseaseDetailsState();
}

class _HeartDiseaseDetailsState extends State<HeartDiseaseDetails> {
  var ageController = TextEditingController();
  var restingBPController = TextEditingController();
  var cholestrolController = TextEditingController();
  var fastingBsController = TextEditingController();
  var heartRateController = TextEditingController();
  var oldPeakController = TextEditingController();

  var selectedSex = 'Male';
  var selectedChestPain = 'ASY';
  var selectedRestingECG = 'Normal';
  var selectedExerciseAngina = 'No';
  var selectedStSlope = 'Up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryDark,
      body: Container(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 60, bottom: 5),
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
              height: 22,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Predict Heart Disease',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    //check if filled
                    if (ageController.text.isEmpty ||
                        restingBPController.text.isEmpty ||
                        cholestrolController.text.isEmpty ||
                        fastingBsController.text.isEmpty ||
                        heartRateController.text.isEmpty ||
                        oldPeakController.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text('Fill the the required fields.'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      return;
                    }

                    double sex = 0;
                    if (selectedSex == 'Female') {
                      sex = 0;
                    } else {
                      sex = 1;
                    }

                    double chestPainType = 0;
                    if (selectedChestPain == 'ASY') {
                      chestPainType = 0;
                    } else if (selectedChestPain == 'NAP') {
                      chestPainType = 1;
                    } else if (selectedChestPain == 'TA') {
                      chestPainType = 2;
                    } else {
                      chestPainType = 3;
                    }

                    double restingECG = 0;
                    if (selectedRestingECG == 'Normal') {
                      restingECG = 0;
                    } else if (selectedRestingECG == 'ST') {
                      restingECG = 1;
                    } else {
                      restingECG = 2;
                    }

                    double exerciseAngina = 0;
                    if (selectedExerciseAngina == 'N') {
                      exerciseAngina = 0;
                    } else {
                      exerciseAngina = 1;
                    }

                    double stSlope = 0;
                    if (selectedStSlope == 'Up') {
                      stSlope = 0;
                    } else if (selectedStSlope == 'Flat') {
                      stSlope = 1;
                    } else {
                      stSlope = 2;
                    }

                    //send for prediction
                    List<String> params = [];
                    params.add(ageController.text.trim());
                    params.add(sex.toString().trim());
                    params.add(chestPainType.toString().trim());
                    params.add(restingBPController.text.trim());
                    params.add(cholestrolController.text.trim());
                    params.add(fastingBsController.text.trim());
                    params.add(restingECG.toString().trim());
                    params.add(heartRateController.text);
                    params.add(exerciseAngina.toString().trim());
                    params.add(oldPeakController.text.trim());
                    params.add(stSlope.toString().trim());

                    List<String> titles = [
                      'RestingBP (mmHg)',
                      'Cholestrol (mg/dL)',
                      'Max HR (beats per min)',
                      'OldPeak (mm)'
                    ];

                    List<double> actualValues = [];
                    actualValues.add(double.parse(restingBPController.text));
                    actualValues.add(double.parse(cholestrolController.text));
                    actualValues.add(double.parse(heartRateController.text));
                    actualValues.add(double.parse(oldPeakController.text));

                    //fill list of charts
                    List<List<Pair>> chartData = List.from(heartData);

                    for (int i = 0; i < chartData.length; i++) {
                      if (chartData[i].length == 3) {
                        chartData[i].removeAt(chartData[i].length - 1);
                      }
                      chartData[i].add(
                        Pair(text: 'Actual', value: actualValues[i]),
                      );
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RiskScreen(
                          titles: titles,
                          chartData: chartData,
                          params: params,
                          type: 'heart',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: ksecondaryDark,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Icon(Icons.check_circle),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            //Inputs
            Expanded(
              child: ListView(
                children: [
                  //Age
                  const TextHead(
                    leading: 'Age',
                    trailing: ' ',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: ageController,
                    hint: 'Age in years',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //SEX
                  const TextHead(
                    leading: 'Select Gender',
                    trailing: ' ',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    decoration: BoxDecoration(
                      color: ksecondaryDark,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      value: selectedSex,
                      items: const [
                        DropdownMenuItem(
                          value: 'Male',
                          child: Text(
                            'Male',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Female',
                          child: Text(
                            'Female',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSex = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Chest Pain Type
                  const TextHead(
                    leading: 'Chest Pain Type',
                    trailing: ' ',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    decoration: BoxDecoration(
                      color: ksecondaryDark,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      value: selectedChestPain,
                      items: const [
                        DropdownMenuItem(
                          value: 'ASY',
                          child: Text(
                            'ASY',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'TA',
                          child: Text(
                            'TA',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'NAP',
                          child: Text(
                            'NAP',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'ATA',
                          child: Text(
                            'ATA',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedChestPain = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Resting BP
                  const TextHead(
                    leading: 'Resting BP',
                    trailing: '0-200*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: restingBPController,
                    hint: 'Resting BP',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Cholestrol
                  const TextHead(
                    leading: 'Serum Cholestrol',
                    trailing: '0-603*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: cholestrolController,
                    hint: 'Serum Cholestrol',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Fasting BS
                  const TextHead(
                    leading: 'Fasting BS',
                    trailing: '0-1*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: fastingBsController,
                    hint: 'Fasting Blood Sugar',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Resting ECG
                  const TextHead(
                    leading: 'Resting ECG',
                    trailing: ' ',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    decoration: BoxDecoration(
                      color: ksecondaryDark,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      value: selectedRestingECG,
                      items: const [
                        DropdownMenuItem(
                          value: 'Normal',
                          child: Text('Normal', style: TextStyle(fontSize: 14)),
                        ),
                        DropdownMenuItem(
                          value: 'ST',
                          child: Text('ST', style: TextStyle(fontSize: 14)),
                        ),
                        DropdownMenuItem(
                          value: 'LVH',
                          child: Text('LVH', style: TextStyle(fontSize: 14)),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedRestingECG = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Heart Rate
                  const TextHead(
                    leading: 'Max. Heart Rate',
                    trailing: '60-202*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: heartRateController,
                    hint: 'Maximum Heart Rate Achieved',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Exercise Angina
                  const TextHead(
                    leading: 'Exercise Induced Angina',
                    trailing: ' ',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    decoration: BoxDecoration(
                      color: ksecondaryDark,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      value: selectedExerciseAngina,
                      items: const [
                        DropdownMenuItem(
                          value: 'No',
                          child: Text('No', style: TextStyle(fontSize: 14)),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text('Yes', style: TextStyle(fontSize: 14)),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedExerciseAngina = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //OldPeak
                  const TextHead(
                    leading: 'Old Peak',
                    trailing: '-2.6-6.2*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: oldPeakController,
                    hint: 'Old Peak',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //ST Slope

                  const TextHead(
                    leading: 'ST Slope',
                    trailing: ' ',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    decoration: BoxDecoration(
                      color: ksecondaryDark,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      value: selectedStSlope,
                      items: const [
                        DropdownMenuItem(
                          value: 'Up',
                          child: Text('Up', style: TextStyle(fontSize: 14)),
                        ),
                        DropdownMenuItem(
                          value: 'Flat',
                          child: Text('Flat', style: TextStyle(fontSize: 14)),
                        ),
                        DropdownMenuItem(
                          value: 'Down',
                          child: Text('Down', style: TextStyle(fontSize: 14)),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedStSlope = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
