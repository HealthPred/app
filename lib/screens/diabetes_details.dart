import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/models/models.dart';
import 'package:healthpred/widgets/textbox.dart';
import 'package:healthpred/widgets/text_head.dart';
import 'package:healthpred/screens/risk_screen.dart';

class DiabetesDetails extends StatelessWidget {
  const DiabetesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var pregController = TextEditingController();
    var glucoseController = TextEditingController();
    var bpController = TextEditingController();
    var skinThicknessController = TextEditingController();
    var insulinController = TextEditingController();
    var bmiController = TextEditingController();
    var diabetesFunController = TextEditingController();
    var ageController = TextEditingController();

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
                    'Predict Diabetes',
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
                  onTap: () async {
                    //check if filled
                    if (pregController.text.isEmpty ||
                        glucoseController.text.isEmpty ||
                        bpController.text.isEmpty ||
                        skinThicknessController.text.isEmpty ||
                        insulinController.text.isEmpty ||
                        bmiController.text.isEmpty ||
                        diabetesFunController.text.isEmpty ||
                        ageController.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text('Fill the the required fields.'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      return;
                    }

                    //preparing for prediction
                    String type = 'diabetes';
                    List<String> params = [];
                    params.add(pregController.text.trim());
                    params.add(glucoseController.text.trim());
                    params.add(bpController.text.trim());
                    params.add(skinThicknessController.text.trim());
                    params.add(insulinController.text.trim());
                    params.add(bmiController.text.trim());
                    params.add(diabetesFunController.text.trim());
                    params.add(ageController.text.trim());

                    List<String> titles = [
                      'Glucose',
                      'BP (Diastolic) (mm Hg)',
                      'Insulin (mu U/ml)',
                      'Diabetes Pedegree Function'
                    ];

                    List<double> actualValues = [];
                    actualValues.add(double.parse(glucoseController.text));
                    actualValues.add(double.parse(bpController.text));
                    actualValues.add(double.parse(insulinController.text));
                    actualValues.add(double.parse(diabetesFunController.text));

                    //fill list of charts
                    List<List<Pair>> chartData = List.from(diabetesData);

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
                          type: 'diabetes',
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
                  //PREGNANCIES
                  const TextHead(
                    leading: 'No. of Pregnancies',
                    trailing: '0-20*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: pregController,
                    hint: 'No of times pregnant',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Glucose
                  const TextHead(
                    leading: 'Glucose',
                    trailing: '0-199*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: glucoseController,
                    hint: 'Plasma Glucose Concentration',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Blood Pressure
                  const TextHead(
                    leading: 'Blood Pressure',
                    trailing: '0-122*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: bpController,
                    hint: 'Diastolic blood pressure (mm Hg)',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Skin Thickness
                  const TextHead(
                    leading: 'Skin Thickness',
                    trailing: '0-99*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: skinThicknessController,
                    hint: 'Triceps skin fold thickness (mm)',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Insulin
                  const TextHead(
                    leading: 'Insulin',
                    trailing: '0-846*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: insulinController,
                    hint: '2-Hour serum insulin (mu U/ml)',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //BMI
                  const TextHead(
                    leading: 'BMI',
                    trailing: '0-68*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: bmiController,
                    hint: 'Body Mass Index',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Diabetes Pedigree Function
                  const TextHead(
                    leading: 'Diabetes Pedigree Function',
                    trailing: '0.08-2.42*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: diabetesFunController,
                    hint: 'Diabetes Pedigree Function',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
