import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:webtech_flutter_app/Edit_profile.dart';
import 'package:webtech_flutter_app/feed.dart';
import 'package:webtech_flutter_app/login.dart';
import 'dart:convert';

import 'package:webtech_flutter_app/main.dart';
import 'package:webtech_flutter_app/view.dart';

class SignUp extends StatefulWidget {
  //final String studentId;
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}
// The variables of my Sign Up form are declared 
class _SignUpState extends State<SignUp> {
  final _myApp = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String _yearGroup = "-1";
  String _campusResidence = "-1";
  TextEditingController favMovieController = TextEditingController();
  TextEditingController favfoodController = TextEditingController();

  final _value = "-1";
// The Http request url is used to connect it to my POST API
  Future<void> _submitForm() async {
    var url = Uri.http('127.0.0.1:5000', '/profile');
    var temp = {
      'name': nameController.text,
      'studentID': studentIdController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'major': majorController.text,
      'dateOfBirth': dobController.text,
      //'yearGroup': _yearGroup,
      //'campusResidence': campusResidence,
      'favMovie': favMovieController.text,
      'favfood': favfoodController.text,
    };

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(temp));

    print(response.statusCode);

    final responseData = json.decode(response.body);

    // Do something with the response data
  }
// This code represents the format of the signup form. It uses the TEXTFORMFIELD
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
                    child: Column(
                  children: [
                    Icon(Icons.verified_user,
                        size: 100, color: Color.fromARGB(255, 188, 83, 75)),
                    const SizedBox(height: 20),
                    const Text(
                      "Welcome to Ashgram",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Create your account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    
                      
                    Container(
                        //child:Center(
                        width: MediaQuery.of(context).size.width*0.3,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextFormField(
                              controller: nameController,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon:
                                      Icon(Icons.person_2_rounded, size: 30),
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                  )),
                            ))
                            ),
                    Container(
                        //child:Center(
                        width: MediaQuery.of(context).size.width*0.3,
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
                      width: MediaQuery.of(context).size.width*0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextFormField(
                            controller: emailController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.mail, size: 30),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                                Container(
                      width: MediaQuery.of(context).size.width*0.3,
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
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: DropdownButtonFormField(
                            value: _value,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text("Year Group"),
                                value: "-1",
                              ),
                              DropdownMenuItem(child: Text("2026"), value: "1"),
                              DropdownMenuItem(child: Text("2025"), value: "2"),
                              DropdownMenuItem(child: Text("2024"), value: "3"),
                              DropdownMenuItem(child: Text("2023"), value: "4"),
                            ],
                            onChanged: (v) {},
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person_2_sharp, size: 30),
                            ))),
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextFormField(
                            controller: majorController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.person_2_rounded, size: 30),
                                labelText: "Major",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextFormField(
                            controller: dobController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.person_2_rounded, size: 30),
                                labelText: "Date Of Birth",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: DropdownButtonFormField(
                            value: _value,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text("Campus Residence"),
                                value: "-1",
                              ),
                              DropdownMenuItem(
                                  child: Text("On-Campus"), value: "1"),
                              DropdownMenuItem(
                                  child: Text("Off-Campus"), value: "2"),
                            ],
                            onChanged: (v) {},
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.house, size: 30),
                            ))),
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextFormField(
                            controller: favMovieController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.movie, size: 30),
                                labelText: "Enter Your Favourite Movie",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextFormField(
                            controller: favfoodController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.food_bank, size: 30),
                                labelText: "Enter Your Favourite Food",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))
                                ),
                    ElevatedButton.icon(
                        onPressed: () {
                          _submitForm();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Myfeed(
                                  
                                )
                              
                              )); 
                        },
                        icon: Icon(Icons.create),
                        label: Text("Submit"),
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size.fromHeight(200),
                          backgroundColor: Color.fromARGB(255, 171, 76, 69),
                        )),
              //If the user already has an account the user taps on the Log in to naviagte to the log in page
                        Text('Already have an account?'),
            GestureDetector(
              onTap: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mylogin(),
                          ));
              },
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Color.fromARGB(255, 188, 83, 75),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                            ))),
                  ],
                )))));
  }
}
