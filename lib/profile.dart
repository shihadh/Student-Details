import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskhive/editing_page.dart';

class ProfilePage extends StatefulWidget {
  final image;
  final name;
  final age;
  final classname;
  final address;
  final index;
  const ProfilePage({super.key,required this.image,required this.name,required this.age,required this.classname,required this.address,required this.index});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5))),
        title: Text("Profile",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color:Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            
             child:  Column(
               children: [
                 Gap(10),
                  CircleAvatar(
                    radius: 50,
                backgroundImage: FileImage(File(widget.image)),
              ),
              Gap(10),
              Text(widget.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Name",style: TextStyle(fontSize: 20)),
                ],
              ),
              Gap(5),
              ListTile(
                title: Text(widget.name),
                tileColor: const Color.fromARGB(255, 232, 231, 231),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Age",style: TextStyle(fontSize: 20)),
                ],
              ),
              Gap(5),
              ListTile(
                title: Text(widget.age),
                tileColor: const Color.fromARGB(255, 232, 231, 231),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Class Name",style: TextStyle(fontSize: 20)),
                ],
              ),
              Gap(5),
              ListTile(
                title: Text(widget.classname),
                tileColor: const Color.fromARGB(255, 232, 231, 231),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Address",style: TextStyle(fontSize: 20)),
                ],
              ),
              Gap(5),
              ListTile(
                title: Text(widget.address),
                tileColor: const Color.fromARGB(255, 232, 231, 231),
              ),
        
               ],
             ),
             
          ),
        ),
      ),
    );
  }
}