

import 'package:flutter/material.dart';

class GeneralStats extends StatefulWidget {
  const GeneralStats({Key? key}) : super(key: key);

  @override
  State<GeneralStats> createState() => _GeneralStatsState();
}

class _GeneralStatsState extends State<GeneralStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      centerTitle: true,
      title: Text(
        "TRACKER",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'saira'
        ),
      ),
    ),
      body: Column(
        children: [
          Container(
            child: Text("TOP 3"),
          ),
        ],
      ),
    );
  }
}
