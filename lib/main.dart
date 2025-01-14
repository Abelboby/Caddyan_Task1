import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/pages/home_page.dart';
import 'package:test1/providers/user_provider.dart';

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MaterialApp(
        title: 'API Call Testing',
        home: HomePage(),
      ),
    );
  }
}
