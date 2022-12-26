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
  int _currentPulse = 20;
  String bloodPressure = "Normal Blood Pressure";
  Color currentColor = Colors.green;

  // This function will be passed down to the Child widget.
  void appendDia(int dia) {
    setState(() {
      _currentDia = dia;
    });
    print(_currentDia.toString());
    calculateBloodPressure();
  }

  // This function will be passed down to the Child widget.
  void appendPulse(int dia) {
    setState(() {
      _currentPulse = dia;
    });
    print(_currentPulse.toString());
    calculateBloodPressure();
  }

  // This function will be passed down to the Child widget.
  void appendSys(int dia) {
    setState(() {
      _currentSys = dia;
    });
    print(_currentSys.toString());
    calculateBloodPressure();
  }

  calculateBloodPressure() {
    print("current stat $bloodPressure");

    if (_currentSys < 120 && _currentDia < 80) {
      setState(() {
        bloodPressure = "Normal Blood Pressure";
        currentColor = Colors.green;
      });
    } else {
      if (_currentSys > 119 && _currentSys < 130) {
        if (_currentDia < 80) {
          setState(() {
            bloodPressure = "Elevated Blood Pressure";
            currentColor= Colors.yellow.shade600;
          });
        }
      }

      if (_currentSys > 129 || _currentDia > 79) {
        setState(() {
          bloodPressure = "High Blood Pressure - Stage 1";
          currentColor= Colors.orangeAccent;
        });
      }

      if (_currentSys > 139 || _currentDia > 89) {
        setState(() {
          bloodPressure = "High Blood Pressure - Stage 2";
          currentColor = Colors.deepOrange;
        });
      }

      if (_currentSys > 180 || _currentDia > 120) {
        setState(() {
          bloodPressure = "Dangerously High Blood Pressure";
          currentColor =Colors.red;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "NEW RECORD",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'saira'),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                color: currentColor,


                  child: Text(bloodPressure.toString(),
                  style: TextStyle(),)),
            )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SystolicNum(callback: appendSys),
                  Diastolic(callback: appendDia),
                  Pulse(callback: appendPulse),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
