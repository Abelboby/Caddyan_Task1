import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;

  const InputField({super.key, required this.controller});
    static final OutlineInputBorder _greenBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.green),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      child: SizedBox(
        width: 450,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: _greenBorder,
            focusedBorder: _greenBorder,
            hintText: 'Enter the User ID',
          ),
        ),
      ),
    );  }
}
