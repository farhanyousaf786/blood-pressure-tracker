import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Pulse extends StatefulWidget {
  final void Function(int) callback;

  const Pulse({Key? key, required this.callback}) : super(key: key);

  @override
  State<Pulse> createState() => _PulseState();
}

class _PulseState extends State<Pulse> {
  //init value of sys meter
  int _currentIntValue = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue.shade50,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          children: [
            Text(
              'Pulse',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '(BMP)',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            NumberPicker(
              value: _currentIntValue,
              minValue: 10,
              maxValue: 200,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() => {
                    _currentIntValue = value,
                    widget.callback(_currentIntValue)
                  }),
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
