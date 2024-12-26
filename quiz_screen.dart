import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required String lessonTitle});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the Spanish word for "apple"?',
      'options': ['Manzana', 'Pera', 'Naranja', 'Fresa'],
      'answer': 'Manzana',
      'explanation': '"Manzana" means "apple" in Spanish.',
    },
    {
      'question': 'Which sentence is grammatically correct?',
      'options': ['Yo tienes un perro.', 'Yo tengo un perro.', 'Yo tener un perro.', 'Yo tieno un perro.'],
      'answer': 'Yo tengo un perro.',
      'explanation': '"Yo tengo un perro" translates to "I have a dog."',
    },
    {
      'question': 'What does "Gracias" mean in English?',
      'options': ['Goodbye', 'Thank you', 'Please', 'Excuse me'],
      'answer': 'Thank you',
      'explanation': '"Gracias" is the Spanish word for "Thank you."',
    },
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void handleAnswer(String selectedOption) {
    final question = questions[currentQuestionIndex];
    bool isCorrect = selectedOption == question['answer'];

    if (isCorrect) {
      setState(() {
        score += 10; // Add points for correct answer
      });
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isCorrect ? 'Correct!' : 'Incorrect'),
          content: Text(isCorrect
              ? 'Well done! ${question['explanation']}'
              : 'The correct answer is "${question['answer']}". ${question['explanation']}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (currentQuestionIndex < questions.length - 1) {
                  setState(() {
                    currentQuestionIndex++;
                  });
                } else {
                  showScoreDialog();
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showScoreDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Quiz Completed!'),
          content: Text('Your score: $score/${questions.length * 10}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                });
              },
              child: const Text('Restart Quiz'),
            ),
          ],
        );
      },
    );
  }

  void addQuestion(String question, List<String> options, String answer, String explanation) {
    setState(() {
      questions.add({
        'question': question,
        'options': options,
        'answer': answer,
        'explanation': explanation,
      });
    });
  }

  void showAddQuestionDialog() {
    final TextEditingController questionController = TextEditingController();
    final TextEditingController option1Controller = TextEditingController();
    final TextEditingController option2Controller = TextEditingController();
    final TextEditingController option3Controller = TextEditingController();
    final TextEditingController option4Controller = TextEditingController();
    final TextEditingController answerController = TextEditingController();
    final TextEditingController explanationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a Question'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: questionController,
                  decoration: const InputDecoration(labelText: 'Question'),
                ),
                TextField(
                  controller: option1Controller,
                  decoration: const InputDecoration(labelText: 'Option 1'),
                ),
                TextField(
                  controller: option2Controller,
                  decoration: const InputDecoration(labelText: 'Option 2'),
                ),
                TextField(
                  controller: option3Controller,
                  decoration: const InputDecoration(labelText: 'Option 3'),
                ),
                TextField(
                  controller: option4Controller,
                  decoration: const InputDecoration(labelText: 'Option 4'),
                ),
                TextField(
                  controller: answerController,
                  decoration: const InputDecoration(labelText: 'Correct Answer'),
                ),
                TextField(
                  controller: explanationController,
                  decoration: const InputDecoration(labelText: 'Explanation'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                addQuestion(
                  questionController.text,
                  [
                    option1Controller.text,
                    option2Controller.text,
                    option3Controller.text,
                    option4Controller.text,
                  ],
                  answerController.text,
                  explanationController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
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
    final question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Quiz',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Score: $score',
                style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LinearProgressIndicator(
            //   value: (currentQuestionIndex + 1) / questions.length,
            //   backgroundColor: Colors.grey[300],
            //   color: Colors.deepPurple,
            // ),
            const SizedBox(height: 20),
            Text(
              'Q${currentQuestionIndex + 1}: ${question['question']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Column(
              children: question['options'].map<Widget>((option) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(option),
                    onTap: () => handleAnswer(option),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddQuestionDialog,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
