import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/models/content_details.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/detail.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'package:newtest/pages/recherche/search1.dart';

class SeriesPage extends StatelessWidget {
  const SeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    
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
    ];

    // Création de la liste des séries avec toutes les images
    final List<ContentDetails> series = List.generate(55, (index) {
      final title = seriesTitles[index % seriesTitles.length];
      final imageNumber = (index % 55) + 1;
      return ContentDetails(
        title: title,
        image: 'assets/images/series-img/series-img-$imageNumber.png',
        rating: 4.0 + (index % 2) * 0.5,
        year: 2020 + (index % 5),
        genre: index % 3 == 0
            ? 'Drame, Thriller'
            : index % 3 == 1
                ? 'Science-Fiction, Fantastique'
                : 'Comédie, Romance',
        description: 'Description détaillée de la série $title. Une histoire captivante qui vous tiendra en haleine du début à la fin.',
        actors: ['Acteur 1', 'Acteur 2', 'Acteur 3'],
        streamingPlatforms: index % 3 == 0
            ? ['Netflix', 'Amazon Prime']
            : index % 3 == 1
                ? ['Disney+', 'HBO Max']
                : ['Apple TV+', 'Paramount+'],
        episodes: 10 + (index % 20),
        seasons: 1 + (index % 5),
        releaseDate: '${1 + (index % 28)} ${['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'][index % 12]} ${2020 + (index % 5)}',
      );
    });

    final List<Info> seriesInfos = series.map((serie) => Info.fromContentDetails(serie)).toList();

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
      body: CustomScrollView(
        slivers: [
          // AppBar personnalisé
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
            title: Text(
              'Séries',
              style: TextStyle(
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
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
              IconButton(
                icon: Icon(
                  Icons.filter_list,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // Contenu principal
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bannière principale
                Container(
                  height: size.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(seriesInfos[0].bgImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          seriesInfos[0].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'TENDANCE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${seriesInfos[0].score}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              seriesInfos[0].type,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow),
                              label: const Text('Lecture'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              ),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add, color: Colors.white),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Sections de contenu
                _buildContentSection(
                  'Tendance',
                  seriesInfos.sublist(1, 11),
                  themeProvider,
                  context,
                ),
                _buildContentSection(
                  'Nouveautés',
                  seriesInfos.sublist(11, 21),
                  themeProvider,
                  context,
                ),
                _buildContentSection(
                  'Continuation',
                  seriesInfos.sublist(21, 31),
                  themeProvider,
                  context,
                ),
                _buildContentSection(
                  'Populaires',
                  seriesInfos.sublist(31, 41),
                  themeProvider,
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(String title, List<Info> items, ThemeProvider themeProvider, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: TextStyle(
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(item),
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
                          item.bgImage,
                          width: 140,
                          height: 200,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 140,
                              height: 200,
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
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
