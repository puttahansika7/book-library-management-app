
import 'package:flutter/material.dart';

class Exp10TestingDebugging extends StatefulWidget {
  const Exp10TestingDebugging({super.key});

  @override
  State<Exp10TestingDebugging> createState() =>
      _Exp10TestingDebuggingState();
}

class _Exp10TestingDebuggingState
    extends State<Exp10TestingDebugging> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Experiment 10 - Testing'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Counter Testing',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Count: $count',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: increment,
                child: const Text('Increment'),
              ),
              const SizedBox(height: 20),
              Text(
                count > 0
                    ? 'Test Passed'
                    : 'Waiting for Test',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
