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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text(
            'Diastolic',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text(
            '(mmHg)',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
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
              fontSize: 15,
              color: Colors.blue.withOpacity(0.4)),
        ),
      ],
    );
  }
}
