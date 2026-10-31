
import 'package:flutter/material.dart';

class Exp6ThemesStyling extends StatelessWidget {
  const Exp6ThemesStyling({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Experiment 6 - Themes'),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.menu_book,
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Book Library',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('Themes and Custom Styling'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Explore Books'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
