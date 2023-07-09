import 'package:calculator/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleCalculator());
}

class SimpleCalculator extends StatelessWidget {
  
  const SimpleCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      title: "Calculator App",
    );
  }
}
