import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Guessing Game',
      home: Scaffold(
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
              const SizedBox(height: 20), // Add some spacing
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter your guess',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // You can handle the user input here
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle the button press to submit the guess
                },
                child: const Text('Submit'),
              ),
              // Add more widgets for the game here (e.g., Text for displaying result)
            ],
          ),
        ),
      ),
    );
  }
}
