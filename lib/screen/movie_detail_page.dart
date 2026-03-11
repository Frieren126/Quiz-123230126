import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Details"), 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Back navigation
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie.imgUrl, width: double.infinity, height: 300, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${movie.title} (${movie.year})", 
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), //text
                  Text("Directed by ${movie.director}", 
                    style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)), //text juga
                  const SizedBox(height: 10),
                  Text(movie.synopsis),
                  const SizedBox(height: 10),
                  Text("Genre: ${movie.genre}", style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text("Casts: ${movie.casts.join(', ')}"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange),
                      Text(" Rated ${movie.rating}/10", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}