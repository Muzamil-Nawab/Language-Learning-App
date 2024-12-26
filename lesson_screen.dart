import 'package:flutter/material.dart';
import 'package:language_learning_app/lesson_datail_screen.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  List<Map<String, String>> lessons = [
    {
      'title': 'Lesson 1',
      'description': 'This is first lesson for understaing the Spanish Language.',
      'content': 'Welcome to the default lesson. This content is here to demonstrate how a lesson will look. You can add your own lessons as needed!'
       
    },
     
    
  ];

  
  // Function to add a lesson
  void addLesson(String title, String description, String content) {
    setState(() {
      lessons.add({
        'title': title,
        'description': description,
        'content': content,
      });
    });
  }

  // Function to delete a lesson
  void deleteLesson(int index) {
    setState(() {
      lessons.removeAt(index);
    });
  }

  // Show dialog to add a lesson
  void showAddLessonDialog() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController contentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a Lesson'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Lesson Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Lesson Description'),
                  maxLines: 3,
                ),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(labelText: 'Lesson Content'),
                  maxLines: 5,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty && contentController.text.isNotEmpty) {
                  addLesson(
                    titleController.text,
                    descriptionController.text,
                    contentController.text,
                  );
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add Lesson'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Lessons', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: lessons.isEmpty
            ? const Center(
                child: Text('No lessons available. Add some lessons to get started!'),
              )
            : ListView.builder(
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  final lesson = lessons[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(lesson['title']!),
                      subtitle: Text(lesson['description']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.black),
                        onPressed: () {
                          deleteLesson(index);
                        },
                      ),
                      onTap: () {
                        // Navigate to LessonDetailScreen with lesson data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LessonDetailScreen(
                              lessonTitle: lesson['title']!,
                              lessonContent: lesson['content']!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddLessonDialog,
        backgroundColor: Colors.deepPurple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

