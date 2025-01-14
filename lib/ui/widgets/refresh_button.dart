import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, child) => FloatingActionButton(
        onPressed: () => provider.reset(),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}