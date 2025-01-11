import 'package:flutter/material.dart';

class TextComboWidget extends StatelessWidget {
  final String leftText;
  final String rightText;

  const TextComboWidget({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 75,
          child: Text(
            leftText,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        const Text(
          ":",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 8),
        Text(
          rightText,
          style: const TextStyle(
              color: Colors.yellow, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
