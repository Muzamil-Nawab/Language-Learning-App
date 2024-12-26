// this screen for if you want to watch the vacabulary and etc!

import 'package:flutter/material.dart';
import 'package:language_learning_app/quiz_screen.dart';

class LessonDetailScreen extends StatelessWidget {
  final String lessonTitle;
  const LessonDetailScreen({required this.lessonTitle, super.key, required String lessonContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(lessonTitle,style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lessonTitle,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Lesson Overview",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "This lesson will help you learn essential phrases, vocabulary, and grammar structures to improve your language skills. By the end of this lesson, you'll be able to form basic sentences and communicate effectively in everyday scenarios.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              "Key Vocabulary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("1. Hello: Hola"),
            const Text("2. Goodbye: Adiós"),
            const Text("3. Thank you: Gracias"),
            const Text("4. Please: Por favor"),
            const SizedBox(height: 24),
            const Text(
              "Grammar Tips",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Learn how to conjugate verbs in the present tense and form simple sentences.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(lessonTitle: lessonTitle),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                "Start Quiz",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
