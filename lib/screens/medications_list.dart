import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:healthpred/screens/medication_details.dart';
import 'package:healthpred/widgets/medication_card.dart';

class MedicationsList extends StatelessWidget {
  final List<String> medicationList;
  final List<String> medicationDesc;
  const MedicationsList(
      {super.key, required this.medicationList, required this.medicationDesc});

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
            const Text(
              'Medications',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      //go to description screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicationDetails(
                                  title: medicationList[index],
                                  desc: medicationDesc[index],
                                )),
                      );
                    },
                    child: MedicationCard(
                      name: medicationList[index],
                    ),
                  );
                }),
                itemCount: medicationList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
