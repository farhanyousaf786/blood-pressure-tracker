import 'package:bloodpressure/Components/HistoryCard.dart';
import 'package:flutter/material.dart';

import '../Database/BpModel.dart';
import '../Database/DbModel.dart';

class ShowBpRecord extends StatefulWidget {
  
   const ShowBpRecord({Key? key,}) : super(key: key);

  @override
  State<ShowBpRecord> createState() => _ShowBpRecordState();
}

class _ShowBpRecordState extends State<ShowBpRecord> {
  var db = DatabaseConnect();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: db.getBpRecord(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        var data = snapshot.data;
        var dataLength = data!.length;
        return dataLength == 0
            ? const Center(
                child: Text("No Record Found"),
              )
            : ListView.builder(
                itemCount: dataLength,
                itemBuilder: (context, i) {
                  return HistoryCard(
                      id: data[i].id,
                      sys: data[i].sys,
                      dia: data[i].dia,
                      pulse: data[i].pulse,
                      bpCondition: data[i].bpCondition,
                      creationDate: data[i].creationDate,
                      deleteFunction: deleteItem);
                },
              );
      },
    );
  }
  
  // function to delete BP
  void deleteItem(BpInfo bpInfo) async {
    await db.deleteBpRecord(bpInfo);
    setState(() {});

  }
  
}
