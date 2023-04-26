import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//This page is linked to my feed page which displays the body of my feed page
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
    
      child: ListView(
        children: <Widget> [
          Row(
            children: <Widget> [
              Container(
                width: 740.0,
                height: 100.0,
                color: Color.fromARGB(255, 245, 243, 243),
                child: Row(
                  children: <Widget> [
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.person_outline,size: 50.0,),
                          onPressed: (){},
                        )
                      ],
                    ),
                    Column(
                      children: <Widget> [
                        Padding(padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        
                         child: OutlinedButton(
                          onPressed: (){},
                         style: OutlinedButton.styleFrom(
                            
                            foregroundColor: Colors.grey,
                            side: BorderSide(color: Colors.black),
                            shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200.0),
                            
                          ),
                         
                          ),
                          child: Text('What is on your mind?')
                          
                            
                        )
                        )
                      ],
                    ),
                    
                  ],
                ),
                
                
              )
            ],
          ),
          Divider(
                      color: Colors.black,
                      thickness: 2.0,
                    )
        ],
      )
      //color: Colors.blue,
    );
  }
}