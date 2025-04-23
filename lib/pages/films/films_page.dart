import 'package:flutter/material.dart';
import 'package:newtest/models/content_details.dart';
import 'package:newtest/pages/Details/details_page.dart';
import 'dart:io';

class FilmsPage extends StatelessWidget {
  const FilmsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      final imageNumber = (index % 45) + 1; // Assure que nous restons dans la plage 1-45
      return ContentDetails(
        title: title,
        image: 'assets/images/films-img/films-img-$imageNumber.png',
        rating: 4.0 + (index % 2) * 0.5, // Alternance entre 4.0 et 4.5
        year: 2020 + (index % 5), // Années entre 2020 et 2024
        genre: index % 3 == 0 
            ? 'Action, Aventure' 
            : index % 3 == 1 
                ? 'Drame, Romance' 
                : 'Comédie, Animation',
        description: 'Description détaillée du film $title. Une histoire captivante qui vous tiendra en haleine du début à la fin.',
        actors: ['Acteur 1', 'Acteur 2', 'Acteur 3'],
        streamingPlatforms: index % 3 == 0 
            ? ['Netflix', 'Amazon Prime'] 
            : index % 3 == 1 
                ? ['Disney+', 'HBO Max'] 
                : ['Apple TV+', 'Paramount+'],
        releaseDate: '${1 + (index % 28)} ${['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'][index % 12]} ${2020 + (index % 5)}',
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text(
          'Films',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
            // Section des films tendance
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
                      itemCount: films.length,
                      itemBuilder: (context, index) {
                        final film = films[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(content: film),
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
                                      film.image,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder: (context, error, stackTrace) {
                                        print('Erreur lors du chargement de l\'image: ${film.image}');
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
                                  film.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 16),
                                    Text(
                                      ' ${film.rating}',
                                      style: const TextStyle(color: Colors.white),
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
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: films.length,
                    itemBuilder: (context, index) {
                      final film = films[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(content: film),
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
                                    film.image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      print('Erreur lors du chargement de l\'image: ${film.image}');
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
                                      film.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      film.genre,
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 16),
                                        Text(
                                          ' ${film.rating}',
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${film.year}',
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