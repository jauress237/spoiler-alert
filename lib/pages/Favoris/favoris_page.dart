import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/models/content_details.dart';
import 'package:newtest/pages/Details/details_page.dart';
import 'package:newtest/providers/favorites_provider.dart';

class FavorisPage extends StatelessWidget {
  const FavorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoris'),
        backgroundColor: Colors.black,
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          if (favoritesProvider.favorites.isEmpty) {
            return const Center(
              child: Text(
                'Aucun favori pour le moment',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
        padding: const EdgeInsets.all(8),
            itemCount: favoritesProvider.favorites.length,
        itemBuilder: (context, index) {
              final favori = favoritesProvider.favorites[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
                color: const Color(0xFF2A2A2A),
            child: ListTile(
                  leading: Image.asset(
                    favori.image,
                width: 50,
                height: 75,
                fit: BoxFit.cover,
              ),
                  title: Text(
                    favori.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    favori.genre,
                    style: const TextStyle(color: Colors.grey),
                  ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        ' ${favori.rating}',
                        style: const TextStyle(color: Colors.white),
                      ),
                ],
              ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(content: favori),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
} 