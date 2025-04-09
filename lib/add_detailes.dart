import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskhive/manage/manage_std.dart';
import 'package:taskhive/models/Std_Model.dart';

class AddDetailes extends StatefulWidget {
  const AddDetailes({super.key});

  @override
  State<AddDetailes> createState() => _AddDetailesState();
}

class _AddDetailesState extends State<AddDetailes> {
  File? image;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _className = TextEditingController();
  final TextEditingController _address = TextEditingController();

  Future<void> imagepicker() async {
    final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pic != null) {
      setState(() {
        image = File(pic.path);
      });
    }
  }

  void saveStudent() {
    if (image == null ||
        _name.text.isEmpty ||
        _age.text.isEmpty ||
        _className.text.isEmpty ||
        _address.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue,
          content: Text("Please fill all fields and select an image")),
      );
      return;
    }

    final newStudent = StdModel(
      image: image!.path,
      Name: _name.text,
      age: _age.text,
      className: _className.text,
      address: _address.text,
    );
    addStudent(newStudent); 
    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: image != null ? FileImage(image!) : null,
                  child: image == null ? Icon(Icons.person, size: 40) : null,
                ),
                Gap(10),
                TextButton(onPressed: imagepicker, child: Text("Add Image")),
                Gap(10),
                TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Gap(10),
                TextField(
                  controller: _age,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Age",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Gap(10),
                TextField(
                  controller: _className,
                  decoration: InputDecoration(
                    hintText: "Class",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Gap(10),
                TextField(
                  controller: _address,
                  decoration: InputDecoration(
                    hintText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Gap(20),
                ElevatedButton(
                  onPressed: saveStudent,
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
