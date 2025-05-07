import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/models/content_details.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/detail.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'dart:io';

class FilmsPage extends StatelessWidget {
  const FilmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    // Liste des titres de films fictifs
    final List<String> filmTitles = [
      'Inception',
      'The Dark Knight',
      'Interstellar',
      'The Matrix',
      'Pulp Fiction',
      'Fight Club',
      'The Shawshank Redemption',
      'The Godfather',
      'Forrest Gump',
      'The Silence of the Lambs',
      'Gladiator',
      'Titanic',
      'Avatar',
      'Jurassic Park',
      'Star Wars: A New Hope',
      'The Avengers',
      'Black Panther',
      'The Lion King',
      'Toy Story',
      'Finding Nemo',
      'The Incredibles',
      'Up',
      'Ratatouille',
      'Wall-E',
      'Coco',
      'Moana',
      'Frozen',
      'Tangled',
      'Zootopia',
      'Big Hero 6',
      'The Jungle Book',
      'Aladdin',
      'Beauty and the Beast',
      'Mulan',
      'The Little Mermaid',
      'Hercules',
      'Tarzan',
      'Lilo & Stitch',
      'The Emperor\'s New Groove',
      'Atlantis: The Lost Empire',
      'Treasure Planet',
      'Brother Bear',
      'Home on the Range',
      'Chicken Little',
      'Meet the Robinsons',
      'Bolt',
      'The Princess and the Frog',
    ];

    // Création de la liste des films avec toutes les images
    final List<ContentDetails> films = List.generate(45, (index) {
      final title = filmTitles[index % filmTitles.length];
      final imageNumber =
          (index % 45) + 1; // Assure que nous restons dans la plage 1-45
      return ContentDetails(
        title: title,
        image: 'assets/images/films-img/films-img-$imageNumber.png',
        rating: 4.0 + (index % 2) * 0.5, // Alternance entre 4.0 et 4.5
        year: 2020 + (index % 5), // Années entre 2020 et 2024
        genre:
            index % 3 == 0
                ? 'Action, Aventure'
                : index % 3 == 1
                ? 'Drame, Romance'
                : 'Comédie, Animation',
        description:
            'Description détaillée du film $title. Une histoire captivante qui vous tiendra en haleine du début à la fin.',
        actors: ['Acteur 1', 'Acteur 2', 'Acteur 3'],
        streamingPlatforms:
            index % 3 == 0
                ? ['Netflix', 'Amazon Prime']
                : index % 3 == 1
                ? ['Disney+', 'HBO Max']
                : ['Apple TV+', 'Paramount+'],
        releaseDate:
            '${1 + (index % 28)} ${['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'][index % 12]} ${2020 + (index % 5)}',
      );
    });

    // Conversion des ContentDetails en Info
    final List<Info> filmInfos = films.map((film) => Info.fromContentDetails(film)).toList();

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Films',
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
            // Section des films tendance
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
                      itemCount: filmInfos.length,
                      itemBuilder: (context, index) {
                        final film = filmInfos[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(film),
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
                                    film.bgImage,
                                    width: 140,
                                    height: 200,
                                      fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  film.name,
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
                                      ' ${film.score}',
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
                    itemCount: filmInfos.length,
                    itemBuilder: (context, index) {
                      final film = filmInfos[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(film),
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
                                  film.bgImage,
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
                                      film.name,
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
                                          ' ${film.score}',
                                          style: TextStyle(
                                            color: themeProvider.isDarkMode ? Colors.grey : Colors.black54,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Text(
                                          film.type,
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
