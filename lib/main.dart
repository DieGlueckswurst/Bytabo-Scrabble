import 'package:flutter/material.dart';
import 'package:scrabble_score_estimator/home_page.dart';

void main() {
  runApp(ScrabbleApp());
}

class ScrabbleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
