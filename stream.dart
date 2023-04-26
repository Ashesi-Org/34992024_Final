
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post.dart';
import 'feed.dart';
import 'home.dart';

class PostListWidget extends StatefulWidget {
  const PostListWidget({Key? key}) : super(key: key);

  @override
  _PostListWidgetState createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  final StreamController<List<Post>> _postsController =
      StreamController<List<Post>>.broadcast();

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    final url = Uri.parse('https://final-project-f2723.uc.r.appspot.com/feed');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final posts =
          (jsonData as List).map((postJson) => Post.fromJson(postJson)).toList();
      // Add posts to the stream
      _postsController.add(posts);
    } else {
      _postsController.addError(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      stream: _postsController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.content),
                trailing: Column(
                  children: [
                    Text(post.date),
                    Text(post.name),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          final error = snapshot.error;
          return Text('Error fetching posts: $error');
        } else {
          return Text('No posts available');
        }
      },
    );
  }
}
