
import 'package:flutter/material.dart';

class Exp8Animations extends StatefulWidget {
  const Exp8Animations({super.key});

  @override
  State<Exp8Animations> createState() =>
      _Exp8AnimationsState();
}

class _Exp8AnimationsState extends State<Exp8Animations> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Experiment 8 - Animations'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: isExpanded ? 250 : 120,
                height: isExpanded ? 200 : 120,
                decoration: BoxDecoration(
                  color: isExpanded
                      ? Colors.deepPurple
                      : Colors.orange,
                  borderRadius: BorderRadius.circular(
                    isExpanded ? 30 : 10,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.menu_book,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: const Text('Animate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
