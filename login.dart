import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webtech_flutter_app/SignUp.dart';
import 'package:webtech_flutter_app/feed.dart';
import 'package:webtech_flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:webtech_flutter_app/view.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Mylogin> {
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 
 // This function is called when the user clicks the login button
  
  Future<void> _submitlogin() async {
    if (studentIdController.text.isEmpty) {
      ScaffoldMessenger.of(context)
      // If the student ID is empty, a SnackBar is shown
          .showSnackBar(const SnackBar(content: Text("Enter student ID")));
      return;
    }
    //The http.get takes in the login credentials of the user to view it in the viewpage profile
    
    final response = await http.get(Uri.parse(
        'https://final-project-f2723.uc.r.appspot.com/profile?s_id=${studentIdController.text}'));
    
    // If the response is successful (status code 200), the user is directed to the view page for their profile
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                viewpage(studentId: studentIdController.text)),
      );
      // Otherwise, the user is directed to the sign-up page
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUp(),
          ));
      print(response.statusCode);
    }
  }
    
  
// Otherwise, an HTTP GET request is sent to the server to retrieve the user's profile

//This code represents the log in form which uses a textformfield
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 243, 243),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 188, 83, 75),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              }),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(25),
                child: Center(
                    child: Column(children: [
                  Icon(Icons.verified_user,
                      size: 100, color: Color.fromARGB(255, 188, 83, 75)),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome Back User",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Log in into your account",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                      //child:Center(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: studentIdController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.person_2_rounded, size: 30),
                                labelText: "Student ID",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )),
                          ))),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: TextFormField(
                          controller: passwordController,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.password, size: 30),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              )))),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _submitlogin();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ])))));
  }
}
