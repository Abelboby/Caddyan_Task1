import 'package:flutter/material.dart';
import 'package:test1/home.dart';

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Api Call Testing',
      home: HomePage(),
    );
  }
}
