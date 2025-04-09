import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskhive/home.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  final TextEditingController _username =TextEditingController();
  final TextEditingController _password =TextEditingController();
  Future<void>login()async{
    String username= _username.text;
    String password= _password.text;
    final prefer= await SharedPreferences.getInstance();
    if(username=="arun" && password=="123"){
    prefer.setString("Username", username);
    prefer.setString("password", password);
    prefer.setBool("isloggin", true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homeScreen()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue,
          content: Text("Invalid username or password")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login",style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: "User Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
              ),
              Gap(10),
              TextField(
                obscureText: false,
                controller: _password,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
              ),
              Gap(20),
              ElevatedButton(  
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                onPressed: login, child: Text("login",style: TextStyle(color: Colors.white))),
          
            ],
          ),
        ),
      ),
    );
  }
}