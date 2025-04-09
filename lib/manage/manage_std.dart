import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskhive/models/Std_Model.dart';

ValueNotifier<List<StdModel>> StdList= ValueNotifier([]);

Future<void>addStudent(StdModel value)async{
  final std_db = await Hive.openBox<StdModel>("student_db");
  await std_db.add(value);
  getAllStudents();
}

Future<void>getAllStudents()async{
  final std_db=await Hive.openBox<StdModel>("Student_db");
  StdList.value.clear();
  StdList.value.addAll(std_db.values);
  StdList.notifyListeners();
}

Future<void>deleteStd(int index)async{
  final std_db = await Hive.openBox<StdModel>("Student_db");
  std_db.deleteAt(index);
  getAllStudents();
}

void editStd(index, StdModel value)async{
  final std_db =await Hive.openBox<StdModel>("Student_db");
  std_db.putAt(index, value);
  getAllStudents();
}