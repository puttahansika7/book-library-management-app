import 'package:flutter/material.dart';

void main() {
  runApp(const BookLibraryApp());
}

class BookLibraryApp extends StatelessWidget {
  const BookLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Library',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Library',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {

          // Screen width
          double width = constraints.maxWidth;

          // Number of columns
          int columns;

          if (width < 600) {
            columns = 1;          // Mobile
          } else if (width < 1000) {
            columns = 2;          // Tablet
          } else {
            columns = 3;          // Desktop
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    'Welcome to My Library 📚',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  GridView.count(
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    children: const [
                      BookCard(
                        title: 'The Alchemist',
                        author: 'Paulo Coelho',
                        category: 'Fiction',
                        year: '1988',
                      ),

                      BookCard(
                        title: 'Atomic Habits',
                        author: 'James Clear',
                        category: 'Self Help',
                        year: '2018',
                      ),

                      BookCard(
                        title: 'Rich Dad Poor Dad',
                        author: 'Robert Kiyosaki',
                        category: 'Finance',
                        year: '1997',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String category;
  final String year;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.category,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),

        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 2,
            color: Colors.grey.shade300,
          ),
        ],
      ),

      child: Column(
        children: [

          Stack(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(10),

                child: Image.network(
                  'https://images.unsplash.com/photo-1543002588-bfa74002ed7e',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const Positioned(
                top: 10,
                right: 10,

                child: CircleAvatar(
                  backgroundColor: Colors.white,

                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            author,

            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(category),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(year),
              ),
            ],
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton.icon(
              onPressed: () {},

              icon: const Icon(Icons.menu_book),

              label: const Text('View Details'),
            ),
          ),
        ],
      ),
    );
  }
}