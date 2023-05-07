import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/screens/symptoms_details.dart';
import 'package:healthpred/widgets/home_card.dart';
import 'package:healthpred/screens/select_disease.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryDark,
      body: Container(
        padding:
            const EdgeInsets.only(top: 80, bottom: 40, right: 28, left: 28),
        child: Column(
          children: [
            const Text(
              'Predict your Health Easily ✌️',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  //navigate to select disease screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectDisease(),
                    ),
                  );
                },
                child: HomeCard(
                  color: kpink,
                  text: 'Check the risk of a potential disease.',
                  icon: UniconsLine.dna,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  //go to Prediction Details Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SymptomsDetails(),
                    ),
                  );
                },
                child: HomeCard(
                  color: kgreen,
                  text: 'Predict diseases from symptoms.',
                  icon: UniconsLine.thermometer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
