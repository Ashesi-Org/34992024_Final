import 'package:flutter/foundation.dart';

class Post {
  final String date;
  final String title;
  final String content;
  final String name;


  Post({required this.date, required this.title, required this.content, required this.name,});

factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] as String,
      content: json['Content'] as String,
      date: json['date'] as String,
      name: json['student_name'] as String,
    );
  }
}