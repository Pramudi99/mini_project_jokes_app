import 'package:flutter/material.dart';
import 'jokes_service.dart';
import 'joke_list_page.dart';

void main() {
  runApp(const JokeApp());
}

class JokeApp extends StatelessWidget {
  const JokeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joke App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.green,
      ),
      home: const MyHomePage(title: 'Joke App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Centers all content in the middle of the page
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Welcome to the Joke App!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to JokeListPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JokeListPage(),
                  ),
                );
              },
              child: const Text(
                'Let\'s Get Started',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

