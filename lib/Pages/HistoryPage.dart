import 'package:bloodpressure/Components/HistoryCard.dart';
import 'package:bloodpressure/Components/ShowBpRecord.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "HISTORY",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'saira'),
          ),
        ),
        body: Container(
          height: 600,
            child: const ShowBpRecord()));
  }
}
