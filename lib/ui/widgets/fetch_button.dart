import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/providers/user_provider.dart';

class FetchButton extends StatelessWidget {
  const FetchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, child) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () => provider.fetchUserData(),
        child: const Text('Fetch User Data'),
      ),
    );
  }
}