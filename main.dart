import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/feed.dart';
import 'package:webtech_flutter_app/home.dart';
import 'package:webtech_flutter_app/view.dart';
import 'package:webtech_flutter_app/login.dart';
import 'SignUp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
    runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  //final String? studentId;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:const MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  //final String? studentId;

  const MyHome({super.key});
//This page reflects the landing page of my social network app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myApp',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 243, 243),
        body:const Center(
          child: Text(
            'Welcome To Ashgram',
            style: TextStyle(
              fontSize: 50,
              color: Color.fromARGB(255, 185, 52, 52),
            ),
          ),
        ),
        //The Get Started button navigates the user to the Sign Up page to fill in the form
        
        floatingActionButton: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) =>  const SignUp())),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text("Get Started"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 157, 52, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          ),
        ),
      ),
    );
  }
}
