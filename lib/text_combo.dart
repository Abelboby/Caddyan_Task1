import 'package:flutter/material.dart';

class TextComboWidget extends StatelessWidget {
  final String label;
  final String value;

  const TextComboWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 75,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Text(
          ":",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
