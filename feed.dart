// ignore_for_file: equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/Home.dart';
import 'package:webtech_flutter_app/SignUp.dart';
import 'package:webtech_flutter_app/Edit_profile.dart';
import 'package:webtech_flutter_app/login.dart';
import 'package:webtech_flutter_app/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:webtech_flutter_app/view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Myfeed extends StatefulWidget {
  //final String studentId;

  const Myfeed({Key? key});

  @override
  _MyfeedState createState() => _MyfeedState();
}

class _MyfeedState extends State<Myfeed> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> _post() async {
    final url = Uri.parse('http://127.0.0.1:5000/feed');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'postID': DateTime.now().millisecondsSinceEpoch.toString(),
        'title': titleController.text,
        'Content': contentController.text,
        'date': dateController.text,
        'student_name': nameController.text,
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error adding post')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 245, 243, 243),
              title: Text(
                'Ashgram',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 188, 83, 75),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 188, 83, 75),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.message,
                    color: Color.fromARGB(255, 188, 83, 75),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Color.fromARGB(255, 188, 83, 75),
                  ),
                  onPressed: () {
                    print('touched');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         Mylogin(),
                    //   ),
                    // );
                  },
                )
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 188, 83, 75),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 188, 83, 75),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.post_add,
                      color: Color.fromARGB(255, 188, 83, 75),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: <Widget>[
              HomeScreen(),
              Icon(Icons.home),
              Icon(Icons.notifications),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: titleController,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon:
                                  Icon(Icons.person_2_rounded, size: 30),
                              labelText: "Title",
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              )),
                        ),
                        TextFormField(
                            controller: contentController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.person_2_rounded, size: 30),
                                labelText: "content",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ))),
                        TextFormField(
                            controller: dateController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.person_2_rounded, size: 30),
                                labelText: "Date",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ))),
                        TextFormField(
                            controller: titleController,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.person_2_rounded, size: 30),
                                labelText: "Student Name",
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ))),
                      ],
                    )),
              )
            ])));
  }
}
