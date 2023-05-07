import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/models/models.dart';
import 'package:healthpred/screens/risk_screen.dart';
import 'package:healthpred/widgets/textbox.dart';
import 'package:healthpred/widgets/text_head.dart';

class CancerDiseaseDetails extends StatefulWidget {
  const CancerDiseaseDetails({super.key});

  @override
  State<CancerDiseaseDetails> createState() => _CancerDiseaseDetailsState();
}

class _CancerDiseaseDetailsState extends State<CancerDiseaseDetails> {
  var selectedSex = 'Female';
  //1: No, 2:Yes
  var selectedSmoking = 'No';
  var selectedFingers = 'No';
  var selectedAnxiety = 'No';
  var selectedPeerPressure = 'No';
  var selectedChronicDisease = 'No';
  var selectedFatigue = 'No';
  var selectedAllergy = 'No';
  var selectedWheezing = 'No';
  var selectedAlcohol = 'No';
  var selectedCoughing = 'No';
  var selectedBredth = 'No';
  var selectedSwallowing = 'No';
  var selectedChestPain = 'No';

  var ageController = TextEditingController();

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
                    'Predict Lung Cancer',
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
                    if (ageController.text.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text('Fill the the required fields.'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      return;
                    }

                    //send for prediction

                    String sex = "";
                    String smoking = "";
                    String fingers = "";
                    String anxiety = "";
                    String peerPressure = "";
                    String chronicDisease = "";
                    String fatigue = "";
                    String allergy = "";
                    String wheezing = "";
                    String alcohol = "";
                    String coughing = "";
                    String breadth = "";
                    String swallowing = "";
                    String chestPain = "";

                    //sex
                    if (selectedSex == 'Female') {
                      sex = '0';
                    } else {
                      sex = '1';
                    }

                    //age
                    String age = ageController.text.trim();

                    //smoking
                    if (selectedSmoking == 'No') {
                      smoking = '1';
                    } else {
                      smoking = '2';
                    }

                    //fingers
                    if (selectedFingers == 'No') {
                      fingers = '1';
                    } else {
                      fingers = '2';
                    }

                    //anxiety
                    if (selectedAnxiety == 'No') {
                      anxiety = '1';
                    } else {
                      anxiety = '2';
                    }

                    //peer pressure
                    if (selectedPeerPressure == 'No') {
                      peerPressure = '1';
                    } else {
                      peerPressure = '2';
                    }

                    //chronic disease
                    if (selectedChronicDisease == 'No') {
                      chronicDisease = '1';
                    } else {
                      chronicDisease = '2';
                    }

                    //fatigue
                    if (selectedFatigue == 'No') {
                      fatigue = '1';
                    } else {
                      fatigue = '2';
                    }

                    //allergy
                    if (selectedAllergy == 'No') {
                      allergy = '1';
                    } else {
                      allergy = '2';
                    }

                    //wheezing
                    if (selectedWheezing == 'No') {
                      wheezing = '1';
                    } else {
                      wheezing = '2';
                    }

                    //alcohol
                    if (selectedAlcohol == 'No') {
                      alcohol = '1';
                    } else {
                      alcohol = '2';
                    }

                    //coughing
                    if (selectedCoughing == 'No') {
                      coughing = '1';
                    } else {
                      coughing = '2';
                    }

                    //breadth
                    if (selectedBredth == 'No') {
                      breadth = '1';
                    } else {
                      breadth = '2';
                    }

                    //swallowing
                    if (selectedSwallowing == 'No') {
                      swallowing = '1';
                    } else {
                      swallowing = '2';
                    }

                    //chestPain
                    if (selectedChestPain == 'No') {
                      chestPain = '1';
                    } else {
                      chestPain = '2';
                    }

                    List<String> params = [];

                    params.add(sex.trim());
                    params.add(age.trim());
                    params.add(smoking.trim());
                    params.add(fingers.trim());
                    params.add(anxiety.trim());
                    params.add(peerPressure.trim());
                    params.add(chronicDisease.trim());
                    params.add(fatigue.trim());
                    params.add(allergy.trim());
                    params.add(wheezing.trim());
                    params.add(alcohol.trim());
                    params.add(coughing.trim());
                    params.add(breadth.trim());
                    params.add(swallowing.trim());
                    params.add(chestPain.trim());

                    List<String> titles = [
                      'Smoking',
                      'Yellow Fingers',
                      'Anxiety',
                      'Peer Pressure',
                      'Chronic disease',
                      'Fatigue',
                      'Allergy',
                      'Wheezing',
                      'Alcohol consumption',
                      'Coughing',
                      'Shortness of Breadth',
                      'Swallowing Problem',
                      'Chest Pain',
                    ];

                    List<double> actualValues = [];
                    if (smoking == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (fingers == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (anxiety == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (peerPressure == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (chronicDisease == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (fatigue == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (allergy == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (wheezing == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (alcohol == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (coughing == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (breadth == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (swallowing == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    if (chestPain == 'No') {
                      actualValues.add(0);
                    } else {
                      actualValues.add(1);
                    }

                    //fill list of charts
                    List<List<Pair>> chartData = List.from(cancerData);

                    for (int i = 0; i < chartData.length; i++) {
                      if (chartData[i].length == 3) {
                        chartData[i].removeAt(chartData[i].length - 1);
                      }
                      chartData[i].add(
                        Pair(text: 'Actual', value: actualValues[i]),
                      );
                    }

                    //prediction
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RiskScreen(
                          titles: titles,
                          chartData: chartData,
                          params: params,
                          type: 'cancer',
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
                  //Sex
                  const TextHead(
                    leading: 'Sex',
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
                          value: 'Female',
                          child: Text(
                            'Female',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Male',
                          child: Text(
                            'Male',
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

                  //AGE
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

                  //SMOKING
                  const TextHead(
                    leading: 'Smoking',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSmoking = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //YELLOW_FINGERS
                  const TextHead(
                    leading: 'Yellow Fingers',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedFingers = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //ANXIETY
                  const TextHead(
                    leading: 'Anxiety',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedAnxiety = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //PEER PRESSURE
                  const TextHead(
                    leading: 'Peer Pressure',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedPeerPressure = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //CHRONIC DISEASE
                  const TextHead(
                    leading: 'Chronic Disease',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedChronicDisease = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //FATIGUE
                  const TextHead(
                    leading: 'Fatigue',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedFatigue = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //ALLERGY
                  const TextHead(
                    leading: 'Allergy',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedAllergy = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //WHEEZING
                  const TextHead(
                    leading: 'Wheezing',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedWheezing = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //ALCOHOL
                  const TextHead(
                    leading: 'Alcohol',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedAlcohol = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //COUGHING
                  const TextHead(
                    leading: 'Coughing',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedCoughing = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //SHORTNESS OF BREADTH
                  const TextHead(
                    leading: 'Shortness Of Breadth',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedBredth = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //SWALLOWING DIFFICULTY
                  const TextHead(
                    leading: 'Swallowing Difficulty',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSwallowing = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //CHEST PAIN
                  const TextHead(
                    leading: 'Chain Pain',
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
                          value: 'No',
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text(
                            'Yes',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
