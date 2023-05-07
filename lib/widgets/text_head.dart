import 'package:flutter/material.dart';

class TextHead extends StatelessWidget {
  final String leading;
  final String trailing;

  const TextHead({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading),
        Text(trailing),
      ],
    );
  }
}
