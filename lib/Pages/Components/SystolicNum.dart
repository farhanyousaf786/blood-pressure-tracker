

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SystolicNum extends StatefulWidget {
  const SystolicNum({Key? key}) : super(key: key);

  @override
  State<SystolicNum> createState() => _SystolicNumState();
}

class _SystolicNumState extends State<SystolicNum> {
  int _currentIntValue = 50;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text('Systolic', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text('(mm Hg)', style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),),
        ),

        NumberPicker(

          value: _currentIntValue,
          minValue: 20,
          maxValue: 300,
          step: 1,
          haptics: true,
          onChanged: (value) => setState(() => _currentIntValue = value),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
              color: Colors.blue.withOpacity(0.4)

          ),
        ),
      ],
    );
  }
}
