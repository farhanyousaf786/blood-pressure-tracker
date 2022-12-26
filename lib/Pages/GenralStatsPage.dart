import 'package:bloodpressure/Components/MaxMinCard.dart';
import 'package:bloodpressure/Database/DbModel.dart';
import 'package:flutter/material.dart';

class GeneralStats extends StatefulWidget {
  const GeneralStats({Key? key}) : super(key: key);

  @override
  State<GeneralStats> createState() => _GeneralStatsState();
}

class _GeneralStatsState extends State<GeneralStats> {
  var db = DatabaseConnect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "TRACKER",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'saira'),
          ),
        ),
        body: FutureBuilder(
          future: db.getBpRecord(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            var data = snapshot.data;
            var dataLength = data!.length;
            return dataLength == 0
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "No Record Found!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: dataLength,
                    itemBuilder: (context, i) {
                      return MaxMinCard(
                        data: data,
                      );
                    },
                  );
          },
        ));
  }
}
