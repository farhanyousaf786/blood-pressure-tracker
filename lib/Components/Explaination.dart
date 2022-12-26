import 'package:flutter/material.dart';

class ExplainState extends StatefulWidget {
  final String text;

  const ExplainState({Key? key, required this.text}) : super(key: key);

  @override
  State<ExplainState> createState() => _ExplainStateState();
}

class _ExplainStateState extends State<ExplainState> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          widget.text,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        )),
      ),
    );
  }
}
