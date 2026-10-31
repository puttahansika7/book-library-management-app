
import 'package:flutter/material.dart';

class Exp7FormsValidation extends StatefulWidget {
  const Exp7FormsValidation({super.key});

  @override
  State<Exp7FormsValidation> createState() =>
      _Exp7FormsValidationState();
}

class _Exp7FormsValidationState
    extends State<Exp7FormsValidation> {
  final formKey = GlobalKey<FormState>();
  final bookController = TextEditingController();

  @override
  void dispose() {
    bookController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 7 - Form Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: bookController,
                decoration: const InputDecoration(
                  labelText: 'Enter Book Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter book name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Book Added: ${bookController.text}',
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
