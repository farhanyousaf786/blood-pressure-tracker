class bPInfo {
  int? id;
  late String sys;
  late String dia;
  late String pulse;
  late DateTime creationDate;


  // create the constructor
  bPInfo({
    this.id,
    required this.sys,
    required this.dia,
    required this.pulse,
    required this.creationDate,

  });

  // to save this data in database we need to convert it to a map
  // let's create a function for that
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sys': sys,
      'dia': dia,// it doesn't support the boolean either, so we save that as integer.
      'pulse': pulse,
      'creationDate': creationDate.toString(), // sqflite database doesn't support the datetime type so we will save it as Text.

    };
  }

  // this function is for debugging only
  @override
  String toString() {
    return 'Todo(id : $id, sys : $sys, dia: $dia, pulse : $pulse,  creationDate : $creationDate,)';
  }
}