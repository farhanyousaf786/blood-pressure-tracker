import 'package:bloodpressure/Components/HistoryCard.dart';
import 'package:bloodpressure/Components/ShowBpRecord.dart';
import 'package:bloodpressure/Database/BpModel.dart';
import 'package:bloodpressure/Database/DbModel.dart';
import 'package:flutter/material.dart';

import 'LandingPage.dart';

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
          leading: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => LandingPage(),
                ),
                    (route) => false,//if you want to disable back feature set to false
              );
            },
            child: Icon(Icons.arrow_back_ios_new),
          ),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "HISTORY",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'saira'),
          ),
        ),
        body:  ShowBpRecord());
  }
}
