import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/providers/theme_provider.dart';

void main() {
  runApp(const RechercheApp());
}

class RechercheApp extends StatelessWidget {
  const RechercheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const RecherchePage(),
    );
  }
}

class RecherchePage extends StatefulWidget {
  const RecherchePage({super.key});

  @override
  _RecherchePageState createState() => _RecherchePageState();
}

class _RecherchePageState extends State<RecherchePage> {
  // Liste initiale de noms
  final List<String> _noms = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Emma',
    'Fiona',
    'George',
  ];

  // Liste filtrée pour afficher les résultats
  List<String> _nomsFiltres = [];

  // Contrôleur pour la barre de recherche
  final TextEditingController _controleurRecherche = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialement, la liste filtrée contient tous les noms
    _nomsFiltres = _noms;
    // Écoute les changements dans la barre de recherche
    _controleurRecherche.addListener(_filtrerNoms);
  }

  // Fonction pour filtrer les noms
  void _filtrerNoms() {
    String recherche = _controleurRecherche.text.toLowerCase();
    setState(() {
      _nomsFiltres = _noms
          .where((nom) => nom.toLowerCase().contains(recherche))
          .toList();
    });
  }

  @override
  void dispose() {
    _controleurRecherche.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
        title: Text(
          'Recherche',
          style: TextStyle(
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barre de recherche
            TextField(
              controller: _controleurRecherche,
              style: TextStyle(
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              decoration: InputDecoration(
                labelText: 'Rechercher',
                labelStyle: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: themeProvider.isDarkMode ? Colors.white30 : Colors.black26,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                filled: true,
                fillColor: themeProvider.isDarkMode ? Colors.white10 : Colors.grey[100],
              ),
            ),
            const SizedBox(height: 16),
            // Liste des résultats
            Expanded(
              child: ListView.builder(
                itemCount: _nomsFiltres.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _nomsFiltres[index],
                      style: TextStyle(
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Vous avez cliqué sur ${_nomsFiltres[index]}'),
                          backgroundColor: themeProvider.isDarkMode ? Colors.white24 : Colors.black87,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}