import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:
            Colors.blue, // primarySwatch is a color that is used by default
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
