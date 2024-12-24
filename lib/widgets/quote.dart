import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  const Quote({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'You are the closest \nI will ever come to magic',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'joining',
          color: Color(0xff4C5980),
        ),
      ),
    );
  }
}
