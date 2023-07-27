// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:number_game/you_lost.dart';
import 'dart:math';
import 'package:number_game/correct_guess.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Number Guessing Game',
      home: NumberGuessingScreen(),
    );
  }
}

class NumberGuessingScreen extends StatefulWidget {
  const NumberGuessingScreen({Key? key}) : super(key: key);

  @override
  _NumberGuessingScreenState createState() => _NumberGuessingScreenState();
}

class _NumberGuessingScreenState extends State<NumberGuessingScreen> {
  int secretNumber =
      Random().nextInt(10); // Generate a random number between 0 and 9
  int attempts = 0;

  final guessController = TextEditingController();

  void _checkGuess(int guess) {
    setState(() {
      attempts++;
    });

    if (guess == secretNumber) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CorrectGuess()),
      );
    } else if (attempts == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => YouLostScreen()),
      );
    } else if (guess < 0 || guess > 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a number between 0 and 10.'),
          duration: Duration(seconds: 2),
        ),
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
              'I have a secret number in my mind (0 - 9).',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'You have 3 chances to guess it.',
              style: TextStyle(fontSize: 18),
            ),
            Text(
                'Secret Number: $secretNumber'), // Display the secret number (for debugging purposes)
            const SizedBox(height: 20),
            TextField(
              controller: guessController,
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
                int guess = int.tryParse(guessController.text) ?? 0;
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
