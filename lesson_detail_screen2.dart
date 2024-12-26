//LessonDetailScreen for displaying specific lesson details
import 'package:flutter/material.dart';

class LessonDetailScreen extends StatelessWidget {
  final String lessonTitle;
  final String lessonContent;

  const LessonDetailScreen({
    super.key,
    required this.lessonTitle,
    required this.lessonContent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lessonTitle),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            lessonContent,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
