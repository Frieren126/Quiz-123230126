import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:latihan_kuis_a/screen/movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  final String username;
  const MovieListPage({super.key, required this.username});

  @override
  State<MovieListPage> createState() => _MovieListPageState(); 
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${widget.username}!"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                movie.imgUrl, 
                width: 50, 
                height: 100, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
              ),
              title: Text("${movie.title} (${movie.year})"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.genre),
                  Text("Rating: ${movie.rating}/10"),
                ],
              ),
              trailing: IconButton(
                // Logic for the Add to List Button
                icon: Icon(
                  movie.isAdded ? Icons.bookmark : Icons.bookmark_border,
                  color: movie.isAdded ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() { 
                    movie.isAdded = !movie.isAdded;
                  });
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}