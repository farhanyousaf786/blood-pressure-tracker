import 'dart:math';

import 'package:flutter/material.dart';

import '../Database/DbModel.dart';

class MaxMinCard extends StatefulWidget {
  final List data;

  const MaxMinCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<MaxMinCard> createState() => _MaxMinCardState();
}

class _MaxMinCardState extends State<MaxMinCard> {
  late List<int> sysList = [];
  late List<int> diaList = [];
  late List<int> pulseList = [];
  late bool isLoading = true;

  @override
  void initState() {
    getStats();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  getStats() {
    // loop into whole list
    for (int i = 0; i < widget.data.length; i++) {
      //convert string data into int so we can insert it into int list and track it easily
      var sys = int.parse(widget.data[i].sys);
      var dia = int.parse(widget.data[i].dia);
      var pulse = int.parse(widget.data[i].pulse);

      //insert data into each int list
      sysList.add(sys);
      diaList.add(dia);
      pulseList.add(pulse);
    }

    print(sysList.reduce(max));
    print(diaList.reduce(min));
    print(pulseList.reduce(min));
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: Text("Loading Data..."))
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.shade200,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 1.01,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 8, bottom: 8),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "High",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red.shade900,
                                    fontFamily: 'bal'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Systolic",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red.shade900,
                                      fontFamily: 'bal'),
                                ),
                                const Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontFamily: 'bal'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Diastolic",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red.shade900,
                                        fontFamily: 'bal'),
                                  ),
                                  const Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontFamily: 'bal'),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pulse",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red.shade900,
                                      fontFamily: 'bal'),
                                ),
                                const Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontFamily: 'bal'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.shade200,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 1.01,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 8, bottom: 8),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Low",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue.shade900,
                                    fontFamily: 'bal'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Systolic",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue.shade900,
                                      fontFamily: 'bal'),
                                ),
                                const Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontFamily: 'bal'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Diastolic",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue.shade900,
                                        fontFamily: 'bal'),
                                  ),
                                  const Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontFamily: 'bal'),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pulse",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue.shade900,
                                      fontFamily: 'bal'),
                                ),
                                const Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontFamily: 'bal'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
