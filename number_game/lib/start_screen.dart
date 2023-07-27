import 'package:flutter/material.dart';
import 'correct_guess.dart';
import 'you_lost.dart';
import 'dart:math'; // Import the dart:math library

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Guessing Game',
      home: NumberGuessingScreen(),
    );
  }
}

class NumberGuessingScreen extends StatefulWidget {
  @override
  _NumberGuessingScreenState createState() => _NumberGuessingScreenState();
}

class _NumberGuessingScreenState extends State<NumberGuessingScreen> {
  int secretNumber = Random().nextInt(
      10); // You can set any random number between 1 and 10 as the secret number
  int attempts = 0;
  bool isCorrect = false;

  final guessController = TextEditingController(); // Add TextEditingController

  void _checkGuess(int guess) {
    setState(() {
      attempts++;
      if (guess == secretNumber) {
        isCorrect = true;
      }
    });

    if (isCorrect) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CorrectGuess()),
      );
    } else if (attempts == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => YouLostScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Guessing Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'I have a secret number in my mind (1 - 10).',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'You have 3 chances to guess it.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller:
                  guessController, // Assign the TextEditingController to the TextField
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter your guess',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // You can handle the user input here
              },
              onSubmitted: (value) {
                int guess = int.tryParse(value) ?? 0;
                _checkGuess(guess);
              },
            ),
            ElevatedButton(
              onPressed: () {
                int guess = int.tryParse(guessController.text) ??
                    0; // Get the value from the TextField explicitly using TextEditingController
                _checkGuess(guess);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
