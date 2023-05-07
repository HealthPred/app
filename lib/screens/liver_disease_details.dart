import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/models/models.dart';
import 'package:healthpred/screens/risk_screen.dart';
import 'package:healthpred/widgets/textbox.dart';
import 'package:healthpred/widgets/text_head.dart';

class LiverDiseaseDetails extends StatefulWidget {
  const LiverDiseaseDetails({super.key});

  @override
  State<LiverDiseaseDetails> createState() => _LiverDiseaseDetailsState();
}

class _LiverDiseaseDetailsState extends State<LiverDiseaseDetails> {
  var ageController = TextEditingController();
  var totalBilrubinController = TextEditingController();
  var directBilrubinController = TextEditingController();
  var alkalinePhosphateController = TextEditingController();
  var alamineController = TextEditingController();
  var aspartateController = TextEditingController();
  var totalProteinsController = TextEditingController();
  var albumineController = TextEditingController();
  var albGloController = TextEditingController();

  var selectedSex = 'Male';

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
                    'Predict Liver Disease',
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
                        totalBilrubinController.text.isEmpty ||
                        directBilrubinController.text.isEmpty ||
                        alkalinePhosphateController.text.isEmpty ||
                        alamineController.text.isEmpty ||
                        aspartateController.text.isEmpty ||
                        totalProteinsController.text.isEmpty ||
                        albumineController.text.isEmpty ||
                        albGloController.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text('Fill the the required fields.'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      return;
                    }

                    //send for prediction
                    double sex = 0;
                    if (selectedSex == 'Female') {
                      sex = 0;
                    } else {
                      sex = 1;
                    }

                    List<String> params = [];
                    params.add(ageController.text.trim());
                    params.add(sex.toString().trim());
                    params.add(totalBilrubinController.text.trim());
                    params.add(directBilrubinController.text.trim());
                    params.add(alkalinePhosphateController.text.trim());
                    params.add(alamineController.text.trim());
                    params.add(aspartateController.text.trim());
                    params.add(totalProteinsController.text.trim());
                    params.add(albumineController.text.trim());
                    params.add(albGloController.text.trim());

                    List<String> titles = [
                      'Total Billirubin (mg/dL)',
                      'Direct Billirubin (mg/dL)',
                      'Alkaline Phosphotase in IU/L',
                      'Alamine Aminotransferase in IU/L',
                      'Aspartate Aminotransferase in IU/L',
                      'Total Proteins',
                      'Albumin in g/dL',
                      'Albumin and Globulin Ratio',
                    ];

                    List<double> actualValues = [];
                    actualValues
                        .add(double.parse(totalBilrubinController.text));
                    actualValues
                        .add(double.parse(directBilrubinController.text));
                    actualValues
                        .add(double.parse(alkalinePhosphateController.text));
                    actualValues.add(double.parse(alamineController.text));
                    actualValues.add(double.parse(aspartateController.text));
                    actualValues
                        .add(double.parse(totalProteinsController.text));
                    actualValues.add(double.parse(albumineController.text));
                    actualValues.add(double.parse(albGloController.text));

                    //fill list of charts
                    List<List<Pair>> chartData = List.from(liverData);

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
                          type: 'liver',
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

                  //Sex
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

                  //Total Bilrubin
                  const TextHead(
                    leading: 'Total Bilrubin',
                    trailing: '0.4-75*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: totalBilrubinController,
                    hint: 'Total Billirubin in mg/dL',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Direct Bilrubin
                  const TextHead(
                    leading: 'Direct Bilrubin',
                    trailing: '0.1-20*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: directBilrubinController,
                    hint: 'Conjugated Billirubin in mg/dL',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Alkaline Phosphate
                  const TextHead(
                    leading: 'Alkaline Phosphotase',
                    trailing: '63-210*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: alkalinePhosphateController,
                    hint: 'ALP in IU/L',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Alamine Aminotraqnsferase
                  const TextHead(
                    leading: 'Alamine Aminotraqnsferase',
                    trailing: '10-2000*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: alamineController,
                    hint: 'ALT in IU/L',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Aspartate Aminotraqnsferase
                  const TextHead(
                    leading: 'Aspartate Aminotraqnsferase',
                    trailing: '10-4929*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: aspartateController,
                    hint: 'AST in IU/L',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Total Proteins
                  const TextHead(
                    leading: 'Total Proteins',
                    trailing: '2.7-9.6*',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: totalProteinsController,
                    hint: 'Total Proteins g/dL',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Albumin
                  const TextHead(
                    leading: 'Albumin',
                    trailing: ' ',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: albumineController,
                    hint: 'Albumin in g/dL',
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Albumin & Globulin Ratio
                  const TextHead(
                    leading: 'Albumin & Globulin Ratio',
                    trailing: ' ',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextBox(
                    controller: albGloController,
                    hint: 'A/G ratio',
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
