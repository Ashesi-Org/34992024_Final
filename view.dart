import 'dart:async';
import 'package:webtech_flutter_app/Edit_profile.dart';

import 'login.dart';
import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/feed.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class viewpage extends StatefulWidget {
  final String studentId;
  const viewpage({required this.studentId}); //constructor to receive the student ID


  //const viewpage({super.key});

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
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
  var json;

  @override
  void initState() {
    super.initState();
    _submitlogin();//// call the function to fetch student data
  }

  Future<void> _submitlogin() async {
    final response = await http.get(
        Uri.https('final-project-f2723.uc.r.appspot.com', '/profile', {'s_id': widget.studentId}));
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      // print(json['studentID']);
      setState(() {
        // studentIdController.text = json['studentID'];
        studentIdController.text = json['studentID'];
        nameController.text = json['name'];
        emailController.text = json['email'];
        passwordController.text = json['password'];
        majorController.text = json['major'];
        dobController.text = json['dateOfBirth'];
        favMovieController.text = json['favMovie'];
        favfoodController.text = json['favfood'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 243, 243),
          title: Text(
            'View Profile',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 188, 83, 75),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 188, 83, 75),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                    Text(
                      "view profile",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextField(
                            readOnly: true,
                            controller: nameController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.mail, size: 30),
                                labelText: "Name",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextField(
                            readOnly: true,
                            controller: studentIdController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.password, size: 30),
                                labelText: "Student ID",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: TextField(
                            readOnly: true,
                            controller: passwordController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.person_2_rounded, size: 30),
                                labelText: "password",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextField(
                            readOnly: true,
                            controller: emailController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.person_2_rounded, size: 30),
                                labelText: "email",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextField(
                            readOnly: true,
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
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextField(
                            readOnly: true,
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
                                labelText: "Date of Birth",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextField(
                            readOnly: true,
                            controller: favMovieController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.movie, size: 30),
                                labelText: "Favourite Movie",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextField(
                            readOnly: true,
                            controller: favfoodController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.food_bank, size: 30),
                                labelText: "Favourite Food",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )))),
                    ElevatedButton.icon(
                        onPressed: () {
                          //_submitForm();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfilePage(
                                      studentId: studentIdController.text)));
                        },
                        icon: Icon(Icons.edit),
                        label: Text("Edit Profile"),
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size.fromHeight(200),
                          backgroundColor: Color.fromARGB(255, 171, 76, 69),
                        ))
                  ],
                )))));
  }
}
