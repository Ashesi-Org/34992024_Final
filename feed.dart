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


class Myfeed extends StatefulWidget {
  //final String studentId;

  const Myfeed({Key? key});

  @override
  _MyfeedState createState() => _MyfeedState();
}

class _MyfeedState extends State<Myfeed> {
 
  

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
            ]
                                
                    
                    )));
              
           
  }
}
