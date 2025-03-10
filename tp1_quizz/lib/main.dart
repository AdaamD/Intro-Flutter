import 'package:flutter/material.dart';
import 'package:tp1/screens/quizz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const QuizzPage(),
    );
  }
}
