import 'package:bloodpressure/Database/DbModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Database/BpModel.dart';

class HistoryCard extends StatefulWidget {
  final int id;
  final String sys;
  final String dia;
  final String pulse;
  final String bpCondition;
  final DateTime creationDate;
  final Function deleteFunction;

  const HistoryCard(
      {Key? key,
      required this.id,
      required this.sys,
      required this.dia,
      required this.pulse,
      required this.bpCondition,
      required this.creationDate,
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
        bpCondition: widget.bpCondition.toString(),
        creationDate: widget.creationDate);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade100,
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.favorite,
                      size: 50,
                      color: widget.bpCondition == "Normal Blood Pressure"
                          ? Colors.green
                          : widget.bpCondition == "Elevated Blood Pressure"
                              ? Colors.yellow.shade700
                              : widget.bpCondition ==
                                      "High Blood Pressure - Stage 1"
                                  ? Colors.orangeAccent.shade400
                                  : widget.bpCondition ==
                                          "High Blood Pressure - Stage 2"
                                      ? Colors.deepOrange.shade400
                                      : Colors.red.shade700),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.bpCondition,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'bal',
                          fontSize: 18),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Systolic",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'bal',
                            fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.sys,
                          style: const TextStyle(fontFamily: 'bal', fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Diastolic",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'bal',
                            fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.dia,
                          style: TextStyle(fontFamily: 'bal', fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Pulse",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'bal',
                            fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.pulse,
                          style: const TextStyle(fontFamily: 'bal', fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          DateFormat('dd MMM yyyy - hh:mm aaa')
                              .format(widget.creationDate),
                        ),
                        IconButton(
                          onPressed: () => widget.deleteFunction(anOtherBpInfo),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
