
import 'package:flutter/material.dart';

class Exp5StateManagement extends StatefulWidget {
  const Exp5StateManagement({super.key});

  @override
  State<Exp5StateManagement> createState() =>
      _Exp5StateManagementState();
}

class _Exp5StateManagementState
    extends State<Exp5StateManagement> {

  List<String> books = [
    'The Alchemist',
    'Atomic Habits',
    'Rich Dad Poor Dad',
  ];

  void addBook() {
    setState(() {
      books.add('New Book');
    });
  }

  void deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Library'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.book),
            title: Text(books[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => deleteBook(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addBook,
        child: const Icon(Icons.add),
      ),
    );
  }
}
