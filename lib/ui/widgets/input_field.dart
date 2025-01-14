import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/providers/user_provider.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});
    static final OutlineInputBorder _greenBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Color.fromARGB(255, 116, 187, 119)),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
        child: SizedBox(
          width: 450,
          child: TextField(
            controller: provider.userIdController,
          decoration: InputDecoration(
            enabledBorder: _greenBorder,
            focusedBorder: _greenBorder,
            hintText: 'Enter the User ID',
            ),
          ),
        ),
      ),
    );
  }
}
