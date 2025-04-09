import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskhive/add_detailes.dart';
import 'package:taskhive/editing_page.dart';
import 'package:taskhive/login.dart';
import 'package:taskhive/manage/manage_std.dart';
import 'package:taskhive/models/Std_Model.dart';
import 'package:taskhive/profile.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  TextEditingController searchController = TextEditingController();
  List<StdModel> studentlist = [];
  List<StdModel> filterStd = [];
  bool isSearching = false;

  Future<void>logout()async{
    final prefer= await SharedPreferences.getInstance();
    prefer.setBool("isloggin", false);
    Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => loginScreen()),
              );
    
  }

  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  void filterStudents(String search) {
    setState(() {
      isSearching = search.isNotEmpty;
      if (search.isEmpty) {
        filterStd = List.from(studentlist);
      } else {
        filterStd =
            studentlist
                .where(
                  (student) =>
                      student.Name.toLowerCase().contains(search.toLowerCase()),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text("Students", style: TextStyle(color: Colors.white)),
        actions: [
          SizedBox(
            width: 190,
            height: 45,
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterStudents(value);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Gap(20),
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDetailes()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ValueListenableBuilder(
        valueListenable: StdList,
        builder: (context, value, child) {
          studentlist = value;
          if (!isSearching) {
            filterStd = List.from(studentlist);
          }

          return ListView.builder(
            itemCount: filterStd.length,
            itemBuilder: (context, index) {
              final data = filterStd[index];

              return Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ProfilePage(
                              image: data.image,
                              name: data.Name,
                              age: data.age,
                              classname: data.className,
                              address: data.address,
                              index: index,
                            ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage:
                        data.image.isNotEmpty
                            ? FileImage(File(data.image))
                            : null,
                    child: data.image.isEmpty ? Icon(Icons.person) : null,
                  ),
                  title: Text(
                    data.Name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => EditingScreen(
                                    Name: data.Name,
                                    image: data.image,
                                    age: data.age,
                                    className: data.className,
                                    address: data.address,
                                    index: index,
                                  ),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteStd(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
