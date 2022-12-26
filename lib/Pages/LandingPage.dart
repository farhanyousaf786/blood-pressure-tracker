import 'package:bloodpressure/Pages/Components/SystolicNum.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Tracker",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),),
      ),
      body: const SystolicNum(),
    );
  }
}
