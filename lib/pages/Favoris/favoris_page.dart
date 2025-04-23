import 'package:flutter/material.dart';

class FavorisPage extends StatelessWidget {
  const FavorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> favoris = [
      {
        'title': 'Inception',
        'image': 'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
        'type': 'Film',
        'rating': 8.8,
      },
      {
        'title': 'Breaking Bad',
        'image': 'https://image.tmdb.org/t/p/w500/1J1EJFQ6dRlKc4UQmMhQqF8xRqM.jpg',
        'type': 'Série',
        'rating': 9.5,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoris'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: favoris.length,
        itemBuilder: (context, index) {
          final favori = favoris[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Image.network(
                favori['image'],
                width: 50,
                height: 75,
                fit: BoxFit.cover,
              ),
              title: Text(favori['title']),
              subtitle: Text(favori['type']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(' ${favori['rating']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
} 