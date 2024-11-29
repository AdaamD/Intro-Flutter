// lib/screens/quiz_page.dart

import 'package:flutter/material.dart';
import 'package:tp1/screens/score.dart';
import '../models/question.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage>
    with SingleTickerProviderStateMixin {
  int _questionIndex = 0;
  int _score = 0; // Variable pour le score
  bool? _isCorrect;
  late AnimationController _controller;

  final List<Question> _questions = [
    Question(
      questionText:
          "La France a dû céder l'Alsace et la Moselle après la guerre de 1870-1871.",
      isCorrect: true,
    ),
    Question(
      questionText: "La Tour Eiffel est située à Lyon.",
      isCorrect: false,
    ),
    Question(
      questionText: "Paris est la capitale de la France.",
      isCorrect: true,
    ),
    Question(
      questionText: "La monnaie officielle de la France est le dollar.",
      isCorrect: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _resetQuiz();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkAnswer(bool userChoice) {
    final isCorrect = _questions[_questionIndex].isCorrect;
    setState(() {
      _isCorrect = userChoice == isCorrect;
      if (_isCorrect!) {
        _score++; // Augmente le score si la réponse est correcte
        _controller.forward(from: 0);
      }
    });

    // Affiche un message temporaire pour la réponse
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isCorrect! ? "Bonne réponse!" : "Mauvaise réponse.",
          style: TextStyle(color: _isCorrect! ? Colors.green : Colors.red),
        ),
        backgroundColor: Colors.white,
      ),
    );

    // Passe à la question suivante après une courte pause
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (_questionIndex < _questions.length - 1) {
          _questionIndex++;
          _isCorrect = null;
        } else {
          _showScore(); // Affiche l'écran de score si le quiz est terminé
        }
      });
    });
  }

  // Fonction pour afficher l'écran de score
  void _showScore() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ScorePage(score: _score, totalQuestions: _questions.length),
      ),
    );
    _resetQuiz(); // Réinitialise le quiz après être revenu de la page de score
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      _isCorrect = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Quizz France '),
            SizedBox(width: 5),
            Text('🇫🇷'),
          ],
        ),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/white_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isCorrect == true)
                ScaleTransition(
                  scale: _controller,
                  child: Icon(Icons.celebration, color: Colors.green, size: 60),
                ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Text(
                  _questions[_questionIndex].questionText,
                  style: TextStyle(fontSize: 20.0, color: Colors.blueGrey[800]),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _checkAnswer(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text("VRAI"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => _checkAnswer(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text("FAUX"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
