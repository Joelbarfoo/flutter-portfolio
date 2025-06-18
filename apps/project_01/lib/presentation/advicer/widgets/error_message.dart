import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.error, size: 40, color: Colors.redAccent,),
      SizedBox(height: 20,),
      Text("Ups.. something gone wrong. pls try again.",style: themeData.textTheme.headlineMedium,textAlign: TextAlign.center,),

    ],
    );
  }
}
