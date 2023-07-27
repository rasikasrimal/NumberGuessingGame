import 'package:flutter/material.dart';

class CorrectGuess extends StatelessWidget {
  const CorrectGuess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Correct Guess'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 80,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            const Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Your guess is correct!',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the guessing screen
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}
