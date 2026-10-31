
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Exp9RestApi extends StatefulWidget {
  const Exp9RestApi({super.key});

  @override
  State<Exp9RestApi> createState() => _Exp9RestApiState();
}

class _Exp9RestApiState extends State<Exp9RestApi> {
  late Future<List<dynamic>> posts;

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Experiment 9 - REST API'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: FutureBuilder<List<dynamic>>(
          future: posts,
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading data'),
              );
            }

            final data = snapshot.data!;

            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${data[index]['id']}'),
                    ),
                    title: Text(data[index]['title']),
                    subtitle: Text(data[index]['body']),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
