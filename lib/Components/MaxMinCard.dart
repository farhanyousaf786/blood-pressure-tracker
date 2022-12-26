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
  @override
  void initState() {
    getStats();

    super.initState();
  }

  getStats() {}

  @override
  Widget build(BuildContext context) {
    return Text(widget.data.length.toString());
  }
}
