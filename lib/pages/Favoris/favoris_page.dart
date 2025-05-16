import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/models/content_details.dart';
import 'package:newtest/pages/Details/details_page.dart';
import 'package:newtest/providers/favorites_provider.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'package:newtest/pages/recherche/search1.dart';

class FavorisPage extends StatelessWidget {
  const FavorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Favoris',
          style: TextStyle(
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecherchePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          if (favoritesProvider.favorites.isEmpty) {
            return Center(
              child: Text(
                'Aucun favori pour le moment',
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
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
                color: themeProvider.isDarkMode ? const Color(0xFF2A2A2A) : Colors.white,
                child: ListTile(
                  leading: Image.asset(
                    favori.image,
                    width: 50,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    favori.title,
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    favori.genre,
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.grey : Colors.grey[700],
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        ' ${favori.rating}',
                        style: TextStyle(
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        ),
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