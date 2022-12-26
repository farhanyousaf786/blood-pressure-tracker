import 'package:flutter/material.dart';

class CheckerPage extends StatefulWidget {
  const CheckerPage({Key? key}) : super(key: key);

  @override
  State<CheckerPage> createState() => _CheckerPageState();
}

class _CheckerPageState extends State<CheckerPage> {
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
      body: Text("RECORD"),
    );
  }
}
