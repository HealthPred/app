import 'package:flutter/material.dart';
import 'package:healthpred/constants/constants.dart';

class SymptomCard extends StatelessWidget {
  final String name;
  final VoidCallback onTapCallback;
  const SymptomCard({
    Key? key,
    required this.name,
    required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onTapCallback,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 6,
              backgroundColor: kgreen,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
