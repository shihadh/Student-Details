import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskhive/home.dart';
import 'package:taskhive/manage/manage_std.dart';
import 'package:taskhive/models/Std_Model.dart';

class EditingScreen extends StatefulWidget {

  final image;
  final Name;
  final age;
  final className;
  final address;
  final index;
  const EditingScreen({
    super.key,
    required this.Name,
    required this.image,
    required this.age,
    required this.className,
    required this.address,
    required this.index
  });

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  File? image;
   TextEditingController nameController = TextEditingController();
   TextEditingController ageController = TextEditingController();
   TextEditingController classNameController = TextEditingController();
   TextEditingController addressController = TextEditingController();

  void initState(){
    super.initState();
    image= widget.image != null ?File(widget.image) : null; 
    nameController.text= widget.Name;
    ageController.text=widget.age;
    classNameController.text=widget.className;
    addressController.text=widget.address;
  }

  Future<void> imagepicker() async {
    final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pic != null) {
      setState(() {
        image = File(pic.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Detailes"),
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
                TextButton(onPressed: imagepicker, child: Text("Edit Image")),
                Gap(10),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Gap(10),
                TextField(
                  controller: ageController,
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
                  controller: classNameController,
                  decoration: InputDecoration(
                    hintText: "Class",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Gap(10),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Gap(20),
                ElevatedButton(
                  onPressed: update,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Submit",
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
    update()async{
    final edit_image=image?.path;
    final editname = nameController.text.trim();
    final editage = ageController.text.trim();
    final editclass= classNameController.text.trim();
    final editaddress= addressController.text.trim();

   if(image == null || editname.isEmpty|| editaddress.isEmpty || editage.isEmpty || editclass.isEmpty){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.blue,content: Text("fill the field")));
   }
  final updatedStd = StdModel(image: edit_image!, Name: editname, age: editage, className: editclass, address: editaddress);

  editStd(widget.index, updatedStd);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.blue,behavior: SnackBarBehavior.floating,content: Text("update sussesfully")));
 Navigator.pop(context);

  }

}
