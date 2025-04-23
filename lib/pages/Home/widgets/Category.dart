import 'package:flutter/material.dart';
import 'package:newtest/pages/Home/widgets/newest.dart';
import 'package:newtest/pages/Home/widgets/pupular.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final categories = [
    {
      'icon': Icons.movie_creation,
      'color': const Color(0xFF605CF4),
      'title': 'film/Action',
    },
    {
      'icon': Icons.heart_broken_rounded,
      'color': const Color.fromARGB(255, 211, 39, 39),
      'title': 'film/Aventure',
    },
    {
      'icon': Icons.collections,
      'color': const Color.fromARGB(255, 114, 104, 104),
      'title': 'film/Drame',
    },
    {
      'icon': Icons.pivot_table_chart_rounded,
      'color': const Color(0xFF4391FF),
      'title': 'film/Horreur',
    },
    {
      'icon': Icons.sports_esports,
      'color': const Color(0xFF7182f2),
      'title': 'film/Animation',
    },
    {
      'icon': Icons.movie_creation,
      'color': const Color(0xFF605CF4),
      'title': 'Serie/Action',
    },
    {
      'icon': Icons.heart_broken_rounded,
      'color': const Color.fromARGB(255, 211, 39, 39),
      'title': 'Serie/Aventure',
    },
    {
      'icon': Icons.collections,
      'color': const Color.fromARGB(255, 114, 104, 104),
      'title': 'Serie/Drame',
    },
    {
      'icon': Icons.pivot_table_chart_rounded,
      'color': const Color(0xFF4391FF),
      'title': 'Serie/Horreur',
    },
    {
      'icon': Icons.sports_esports,
      'color': const Color(0xFF7182f2),
      'title': 'Serie/Animation',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            padding: const EdgeInsets.all(25),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (_, index) => Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: categories[index]['color'] as Color,
                        ),
                        child: Icon(
                          categories[index]['icon'] as IconData,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        categories[index]['title'] as String,
                        style: TextStyle(
                          color: Colors.black.withOpacity(1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
              separatorBuilder: (_, index) => const SizedBox(width: 30),
              itemCount: categories.length,
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: 400,
            child: const Text(
              'POPULAIRES',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          PopularSection(),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: 410,
            child: const Text(
              'NOUVEAUX',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          NewestSection(),
        ],
      ),
    );
  }
}
