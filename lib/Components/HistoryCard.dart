import 'package:bloodpressure/Database/DbModel.dart';
import 'package:flutter/material.dart';

import '../Database/BpModel.dart';

class HistoryCard extends StatefulWidget {
  final int id;
  final String sys;
  final String dia;
  final String pulse;
  final DateTime creationDate;
  final Function insertFunction;
  final Function deleteFunction;

  const HistoryCard(
      {Key? key,
      required this.id,
      required this.sys,
      required this.dia,
      required this.pulse,
      required this.creationDate,
      required this.insertFunction,
      required this.deleteFunction})
      : super(key: key);

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {


  @override
  Widget build(BuildContext context) {
    var anOtherBpInfo = BpInfo(
        id: widget.id,
        sys: widget.sys,
        dia: widget.dia.toString(),
        pulse: widget.pulse.toString(),
        creationDate: widget.creationDate);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.sys),
              Text(widget.dia),
              Text(widget.pulse),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.creationDate.toString()),
              GestureDetector(onTap: () {

                deleteItem(anOtherBpInfo);


              }, child: Text("Delete"))
            ],
          ),
        )
      ],
    );
  }
  // create a database object so we can access database functions
  var db = DatabaseConnect();
  // function to delete BP
  void deleteItem(BpInfo bpInfo) async {
    await db.deleteBpRecord(bpInfo);
    setState(() {});

  }
}
