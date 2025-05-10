import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/models/content_details.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/detail.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'dart:io';

class SeriesPage extends StatelessWidget {
  const SeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    // Liste des titres de séries fictifs
    final List<String> seriesTitles = [
      'Breaking Bad',
      'Game of Thrones',
      'Stranger Things',
      'The Crown',
      'The Mandalorian',
      'The Witcher',
      'Peaky Blinders',
      'Money Heist',
      'Dark',
      'The Boys',
      'Westworld',
      'The Handmaid\'s Tale',
      'The Walking Dead',
      'Better Call Saul',
      'Ozark',
      'The Last of Us',
      'House of the Dragon',
      'Wednesday',
      'The Sandman',
      'Bridgerton',
      'The Queen\'s Gambit',
      'Squid Game',
      'Loki',
      'WandaVision',
      'The Falcon and the Winter Soldier',
      'Hawkeye',
      'Moon Knight',
      'Ms. Marvel',
      'She-Hulk',
      'What If...?',
      'The Book of Boba Fett',
      'Obi-Wan Kenobi',
      'Andor',
      'The Bad Batch',
      'Tales of the Jedi',
      'Visions',
      'Ahsoka',
      'The Acolyte',
      'Skeleton Crew',
      'Lando',
      'Rangers of the New Republic',
      'The Mandalorian Season 3',
      'The Mandalorian Season 4',
      'The Book of Boba Fett Season 2',
      'Obi-Wan Kenobi Season 2',
      'Andor Season 2',
      'The Bad Batch Season 2',
      'Tales of the Jedi Season 2',
      'Visions Season 2',
      'Ahsoka Season 2',
      'The Acolyte Season 2',
      'Skeleton Crew Season 2',
      'Lando Season 2',
      'Rangers of the New Republic Season 2',
    ];

    // Création de la liste des séries avec toutes les images
    final List<ContentDetails> series = List.generate(55, (index) {
      final title = seriesTitles[index % seriesTitles.length];
      final imageNumber =
          (index % 55) + 1; // Assure que nous restons dans la plage 1-55
      return ContentDetails(
        title: title,
        image: 'assets/images/series-img/series-img-$imageNumber.png',
        rating: 4.0 + (index % 2) * 0.5, // Alternance entre 4.0 et 4.5
        year: 2020 + (index % 5), // Années entre 2020 et 2024
        genre:
            index % 3 == 0
                ? 'Drame, Thriller'
                : index % 3 == 1
                ? 'Science-Fiction, Fantastique'
                : 'Comédie, Romance',
        description:
            'Description détaillée de la série $title. Une histoire captivante qui vous tiendra en haleine du début à la fin.',
        actors: ['Acteur 1', 'Acteur 2', 'Acteur 3'],
        streamingPlatforms:
            index % 3 == 0
                ? ['Netflix', 'Amazon Prime']
                : index % 3 == 1
                ? ['Disney+', 'HBO Max']
                : ['Apple TV+', 'Paramount+'],
        episodes: 10 + (index % 20), // Entre 10 et 30 épisodes
        seasons: 1 + (index % 5), // Entre 1 et 6 saisons
        releaseDate:
            '${1 + (index % 28)} ${['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'][index % 12]} ${2020 + (index % 5)}',
      );
    });

    // Conversion des ContentDetails en Info
    final List<Info> seriesInfos = series.map((serie) => Info.fromContentDetails(serie)).toList();

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Séries',
          style: TextStyle(
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section des séries tendance
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tendance',
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: seriesInfos.length,
                      itemBuilder: (context, index) {
                        final serie = seriesInfos[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(serie),
                              ),
                            );
                          },
                          child: Container(
                            width: 140,
                            margin: const EdgeInsets.only(right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                    serie.bgImage,
                                    width: 140,
                                    height: 200,
                                      fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  serie.name,
                                  style: TextStyle(
                                    color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 16),
                                    Text(
                                      ' ${serie.score}',
                                      style: TextStyle(
                                        color: themeProvider.isDarkMode ? Colors.grey : Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Section des nouveautés
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nouveautés',
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: seriesInfos.length,
                    itemBuilder: (context, index) {
                      final serie = seriesInfos[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(serie),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: themeProvider.isDarkMode ? Colors.grey[900] : Colors.grey[200],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                                  child: Image.asset(
                                  serie.bgImage,
                                  width: double.infinity,
                                  height: 200,
                                    fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      serie.name,
                                      style: TextStyle(
                                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 16),
                                        Text(
                                          ' ${serie.score}',
                                          style: TextStyle(
                                            color: themeProvider.isDarkMode ? Colors.grey : Colors.black54,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Text(
                                          serie.type,
                                          style: TextStyle(
                                            color: themeProvider.isDarkMode ? Colors.grey : Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
