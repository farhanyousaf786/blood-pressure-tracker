import 'package:bloodpressure/Components/Diastolic.dart';
import 'package:bloodpressure/Components/Pulse.dart';
import 'package:bloodpressure/Components/SystolicNum.dart';
import 'package:flutter/material.dart';

class CheckerPage extends StatefulWidget {
  const CheckerPage({Key? key}) : super(key: key);

  @override
  State<CheckerPage> createState() => _CheckerPageState();
}

class _CheckerPageState extends State<CheckerPage> {
  int _currentSys = 50;
  int _currentDia = 50;
  int _currentPulse = 50;

  // This function will be passed down to the Child widget.
  void appendDia(int dia) {
    setState(() {
      this._currentDia = dia;
    });
    print(_currentDia.toString());
  }

  // This function will be passed down to the Child widget.
  void appendPulse(int dia) {
    setState(() {
      this._currentPulse = dia;
    });
    print(_currentPulse.toString());
  }

  // This function will be passed down to the Child widget.
  void appendSys(int dia) {
    setState(() {
      this._currentSys = dia;
    });
    print(_currentSys.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NEW RECORD",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'saira'),
        ),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SystolicNum(callback: appendSys),
            Diastolic(callback: appendDia),
            Pulse(callback: appendPulse),
          ],
        ),
      )),
    );
  }
}
