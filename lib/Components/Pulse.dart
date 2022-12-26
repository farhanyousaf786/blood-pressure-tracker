
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Pulse extends StatefulWidget {
  const Pulse({Key? key}) : super(key: key);

  @override
  State<Pulse> createState() => _PulseState();
}

class _PulseState extends State<Pulse> {
  //init value of sys meter
  int _currentIntValue = 50;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text('Pulse', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text('(BMP)', style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),),
        ),

        NumberPicker(
          value: _currentIntValue,
          minValue: 20,
          maxValue: 200,
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
