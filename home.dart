import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webtech_flutter_app/stream.dart';
import 'dart:convert';
import 'post.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final StreamController<List<Post>> _postsController =
      StreamController<List<Post>>.broadcast();
  Stream<List<Post>> get posts => _postsController.stream;

  @override
  void dispose() {
    _postsController.close();
    super.dispose();
  }

  Future<void> _addPost() async {
    final url = Uri.parse('https://final-project-f2723.uc.r.appspot.com/feed');
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
      // Fetch updated posts and add them to the stream
      _fetchPosts();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error adding post')),
      );
    }
  }

  Future<void> _fetchPosts() async {
    final url = Uri.parse('https://final-project-f2723.uc.r.appspot.com/feed');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final posts = (jsonData as List)
          .map((postJson) => Post.fromJson(postJson))
          .toList();
      _postsController.add(posts);
    } else {
      _postsController.addError(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch initial posts when the widget is first built
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       
        child: Column(children: <Widget>[
      Form(
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
                    prefixIcon: Icon(Icons.person_2_rounded, size: 30),
                    labelText: "Title",
                    labelStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    )),
              )
            ],
          )),
      TextFormField(
          controller: contentController,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.person_2_rounded, size: 30),
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
              prefixIcon: Icon(Icons.person_2_rounded, size: 30),
              labelText: "Date",
              labelStyle: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ))),
      TextFormField(
          controller: nameController,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.person_2_rounded, size: 30),
              labelText: "Student Name",
              labelStyle: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ))),
      ElevatedButton(
        onPressed: () {
          _fetchPosts();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostListWidget(),
              ));
        },
        child: Text('Post'),
      )
    ]));
  }
}
