import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthpred/constants/constants.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required this.controller,
    required this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
      ], // Only numbers can be entered
      keyboardType: TextInputType.number,
      controller: controller,
      autofocus: false,
      cursorColor: Colors.white,
      style: const TextStyle(fontSize: 14.0),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: ksecondaryDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
