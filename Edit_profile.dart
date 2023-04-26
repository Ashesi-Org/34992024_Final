import 'dart:js';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/feed.dart';
import 'package:webtech_flutter_app/main.dart';
// ignore: unused_import
import 'package:webtech_flutter_app/SignUp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:webtech_flutter_app/view.dart';

class EditProfilePage extends StatefulWidget {
  final String studentId;
  const EditProfilePage({required this.studentId});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late Future<void> _profileData;
  late TextEditingController nameController;
  late TextEditingController studentIdController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController majorController;
  late TextEditingController dobController;
  late TextEditingController yearGroupController;
  late TextEditingController campusResidenceController;
  late TextEditingController favMovieController;
  late TextEditingController favfoodController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    studentIdController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    majorController = TextEditingController();
    dobController = TextEditingController();
    yearGroupController = TextEditingController();
    campusResidenceController = TextEditingController();
    favMovieController = TextEditingController();
    favfoodController = TextEditingController();
    _profileData = fetchuser();
  }

  Future<void> fetchuser() async {
    final response = await http.get(Uri.parse(
        'https://final-project-f2723.uc.r.appspot.com/profile?s_id=${widget.studentId}'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      setState(() {
        studentIdController.text = json['studentId'];
        nameController.text = json['name'];
        emailController.text = json['email'];
        passwordController.text = json['password'];
        majorController.text = json['major'];
        dobController.text = json['dateOfBirth'];
        yearGroupController.text = json['yearGroup'];
        campusResidenceController.text = json['campusResidence'];
        favMovieController.text = json['favMovie'];
        favfoodController.text = json['favfood'];
      });
    }
  }

  Future<void> profileupdate() async {
    final url = Uri.parse(
        'https://final-project-f2723.uc.r.appspot.com/profile?s_id=${widget.studentId}');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        "name":nameController.text,
        "studentId":studentIdController.text,
        "email": emailController.text,
        'password':passwordController.text,
        'major': majorController.text,
        'dob': dobController.text,
        'yearGroup': yearGroupController.text,
        'campusResidence': campusResidenceController.text,
        'favMovie': favMovieController.text,
        'favfood': favfoodController.text,
      }),
    );
    if (response.statusCode == 200) {
      // Profile updated successfully
    } else {
      // Error updating profile
    }
  }
    @override
    Widget build(BuildContext context) {
      // @override
      // Widget build(BuildContext context) {
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
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ));
              },
            ),
          ),
          body: Container(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: ListView(
                children: [
                  Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Center(
                      child: Column(
                    children: [
                      Icon(Icons.verified_user,
                          size: 100, color: Color.fromARGB(255, 188, 83, 75)),
                      const SizedBox(height: 20),
                    ],
                  )),
                  TextFormField(
                    readOnly: true,
                      controller: nameController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_2_rounded, size: 30),
                          labelText: "Name",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ))),
                  TextFormField(
                    readOnly: true,
                      controller: studentIdController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_2_rounded, size: 30),
                          labelText: "Student ID",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ))),
                  TextFormField(
                    readOnly: true,
                      controller: emailController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_2_rounded, size: 30),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ))),
                  TextFormField(
                    readOnly: true,
                      controller: passwordController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_2_rounded, size: 30),
                          labelText: "password",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ))),
                  TextFormField(
                      controller: majorController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_2_rounded, size: 30),
                          labelText: "Major",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ))),
                  TextField(
                      controller: dobController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_2_rounded, size: 30),
                          labelText: "Date Of Birth",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ))),
                  TextFormField(
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
                        )),
                  ),
                  TextFormField(
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
                          ))),
                  ElevatedButton.icon(
                      onPressed: () {
                        profileupdate();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => viewpage(studentId: studentIdController.text),
                            ));
                      },
                      icon: Icon(Icons.edit),
                      label: Text("Save Changes"),
                      style: ElevatedButton.styleFrom(
                        maximumSize: Size.fromHeight(200),
                        backgroundColor: Color.fromARGB(255, 171, 76, 69),
                      )),
                ],
              )));
    }
  }

