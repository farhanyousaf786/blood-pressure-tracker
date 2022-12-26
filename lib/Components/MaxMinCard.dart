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
    Future.delayed(const Duration(seconds: 2), () {
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
    return Text(widget.data.toString());
  }
}
