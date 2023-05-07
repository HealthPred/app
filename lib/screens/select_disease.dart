import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/screens/cancer_disease_details.dart';
import 'package:healthpred/screens/heart_disease_details.dart';
import 'package:healthpred/screens/liver_disease_details.dart';
import 'package:unicons/unicons.dart';

import '../widgets/disease_card.dart';
import 'package:healthpred/screens/diabetes_details.dart';

class SelectDisease extends StatelessWidget {
  const SelectDisease({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryDark,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
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
              height: 28,
            ),
            const Text(
              'Select Disease Test',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      //go to diabetes details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DiabetesDetails(),
                        ),
                      );
                    },
                    child: DiseaseCard(
                      color: kblue,
                      icon: UniconsLine.medical_drip,
                      text: 'Diabetes',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //go to heart disease details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HeartDiseaseDetails(),
                        ),
                      );
                    },
                    child: DiseaseCard(
                      color: kpink,
                      icon: UniconsLine.heartbeat,
                      text: 'Heart Failure',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //go to liver disease details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LiverDiseaseDetails(),
                        ),
                      );
                    },
                    child: DiseaseCard(
                      color: kfloro,
                      icon: UniconsLine.water_glass,
                      text: 'Liver Failure',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //go to cancer disease screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CancerDiseaseDetails(),
                        ),
                      );
                    },
                    child: DiseaseCard(
                      color: korange,
                      icon: UniconsLine.heart_rate,
                      text: 'Lung Cancer',
                    ),
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
