import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Diastolic extends StatefulWidget {
  final void Function(int) callback;

  const Diastolic({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<Diastolic> createState() => _DiastolicState();
}

class _DiastolicState extends State<Diastolic> {
  //init value of sys meter
  int _currentIntValue = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
    color: Colors.blue.shade50,),

    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
          children: [
            Text(
              'Diastolic',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '(mmHg)',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            NumberPicker(
              value: _currentIntValue,
              minValue: 20,
              maxValue: 300,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() =>
                  {_currentIntValue = value, widget.callback(_currentIntValue)}),
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.blue.withOpacity(0.4)),
            ),
          ],
        ),
    ),
    );
  }
}
