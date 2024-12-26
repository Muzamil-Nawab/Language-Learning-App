import 'package:flutter/material.dart';
import 'package:language_learning_app/lesson_screen.dart';
import 'quiz_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language Learning',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildButton(context, 'Start Lessons', const LessonScreen(), Colors.teal),
              const SizedBox(height: 16),
              buildButton(context, 'Take a Quiz', const QuizScreen(lessonTitle: '',), Colors.orange),
              const SizedBox(height: 16),
              buildButton(context, 'View Profile', const ProfileScreen(), Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String text, Widget screen, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: color,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

