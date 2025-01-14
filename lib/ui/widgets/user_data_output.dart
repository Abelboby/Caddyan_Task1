import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/providers/user_provider.dart';
import 'package:test1/ui/widgets/green_card.dart';

class UserDataOutput extends StatelessWidget {
  const UserDataOutput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, _) {
        if (provider.currentState == HomeState.loading) {
          return const CircularProgressIndicator();
        } else if (provider.currentState == HomeState.error) {
          return Text(
            provider.apiError!,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w700,
            ),
          );
        } else if (provider.currentState == HomeState.success) {
          return GreenCard(user: provider.user!);
        } else {
          return const Text(
            "Enter a valid user ID and click to get the user details",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w700,
            ),
            );
        }
      },
    );  }
}