import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskhive/home.dart';
import 'package:taskhive/login.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    checking();
  }
  Future<void>checking()async{
    final prefer = await SharedPreferences.getInstance();
    bool isloggin=prefer.getBool("isloggin")?? false;
    if(isloggin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homeScreen()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
