import 'package:flutter/material.dart';
import 'package:test1/pages/home_page.dart';

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'API Call Testing',
      home: HomePage(),
    );
  }
}
