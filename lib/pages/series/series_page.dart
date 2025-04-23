import 'package:flutter/material.dart';
import 'package:newtest/models/content_details.dart';
import 'package:newtest/pages/Details/details_page.dart';
import 'dart:io';

class SeriesPage extends StatelessWidget {
  const SeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text(
          'Séries',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
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
                  const Text(
                    'Tendance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: series.length,
                      itemBuilder: (context, index) {
                        final serie = series[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => DetailsPage(content: serie),
                              ),
                            );
                          },
                          child: Container(
                            width: 140,
                            margin: const EdgeInsets.only(right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      serie.image,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        print(
                                          'Erreur lors du chargement de l\'image: ${serie.image}',
                                        );
                                        print('Erreur: $error');
                                        return Container(
                                          color: Colors.grey[800],
                                          child: const Center(
                                            child: Icon(
                                              Icons.error_outline,
                                              color: Colors.red,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  serie.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    Text(
                                      ' ${serie.rating}',
                                      style: const TextStyle(
                                        color: Colors.white,
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
                  const Text(
                    'Nouveautés',
                    style: TextStyle(
                      color: Colors.white,
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
                    itemCount: series.length,
                    itemBuilder: (context, index) {
                      final serie = series[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(content: serie),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[900],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.asset(
                                    serie.image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      print(
                                        'Erreur lors du chargement de l\'image: ${serie.image}',
                                      );
                                      print('Erreur: $error');
                                      return Container(
                                        color: Colors.grey[800],
                                        child: const Center(
                                          child: Icon(
                                            Icons.error_outline,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      serie.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      serie.genre,
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        Text(
                                          ' ${serie.rating}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${serie.seasons} saisons',
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 12,
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
