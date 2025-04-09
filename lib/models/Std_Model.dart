import 'package:hive_flutter/adapters.dart';
 part 'Std_Model.g.dart';

@HiveType(typeId: 0)
class StdModel {
  
  @HiveField(0)
  final String image;

  @HiveField(1)
  String Name;

  @HiveField(2)
  String age;

  @HiveField(3)
  String className;

  @HiveField(4)
   String address;

  StdModel({
  required this.image,
    required this.Name,
    required this.age,
    required this.className,
    required this.address
  });
}