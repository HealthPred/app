import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';
import 'package:unicons/unicons.dart';

class MedicationCard extends StatelessWidget {
  final String name;
  const MedicationCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: ksecondaryDark,
      ),
      child: Row(
        children: [
          const Icon(
            UniconsLine.tablets,
            size: 32,
          ),
          const SizedBox(
            width: 18,
          ),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
