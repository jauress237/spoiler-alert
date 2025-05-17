import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/pages/Home/widgets/newest.dart';
import 'package:newtest/pages/Home/widgets/pupular.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'package:newtest/pages/Films/films_page.dart';
import 'package:newtest/pages/Series/series_page.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final Map<String, List<Map<String, dynamic>>> categories = {
    'Films': [
      {
        'icon': Icons.movie_creation,
        'color': const Color(0xFF605CF4),
        'title': 'Action',
      },
      {
        'icon': Icons.heart_broken_rounded,
        'color': const Color.fromARGB(255, 211, 39, 39),
        'title': 'Aventure',
      },
      {
        'icon': Icons.collections,
        'color': const Color.fromARGB(255, 114, 104, 104),
        'title': 'Drame',
      },
      {
        'icon': Icons.pivot_table_chart_rounded,
        'color': const Color(0xFF4391FF),
        'title': 'Horreur',
      },
      {
        'icon': Icons.sports_esports,
        'color': const Color(0xFF7182f2),
        'title': 'Animation',
      },
    ],
    'Séries': [
      {
        'icon': Icons.movie_creation,
        'color': const Color(0xFF605CF4),
        'title': 'Action',
      },
      {
        'icon': Icons.heart_broken_rounded,
        'color': const Color.fromARGB(255, 211, 39, 39),
        'title': 'Aventure',
      },
      {
        'icon': Icons.collections,
        'color': const Color.fromARGB(255, 114, 104, 104),
        'title': 'Drame',
      },
      {
        'icon': Icons.pivot_table_chart_rounded,
        'color': const Color(0xFF4391FF),
        'title': 'Horreur',
      },
      {
        'icon': Icons.sports_esports,
        'color': const Color(0xFF7182f2),
        'title': 'Animation',
      },
    ],
  };

  void _navigateToCategory(BuildContext context, String section, String category) {
    if (section == 'Films') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FilmsPage(),
        ),
      );
    } else if (section == 'Séries') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SeriesPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Catégories',
              style: TextStyle(
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...categories.entries.map((entry) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  entry.key,
                  style: TextStyle(
                    color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = entry.value[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: category['color'] as Color,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => _navigateToCategory(context, entry.key, category['title'] as String),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  category['icon'] as IconData,
                                  color: category['color'] as Color,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  category['title'] as String,
                                  style: TextStyle(
                                    color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemCount: entry.value.length,
                ),
              ),
              const SizedBox(height: 15),
            ],
          )).toList(),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   child: Text(
          //     'POPULAIRES',
          //     style: TextStyle(
          //       color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20,
          //     ),
          //   ),
          // ),
          PopularSection(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'NOUVEAUX',
              style: TextStyle(
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          NewestSection(),
        ],
      ),
    );
  }
}
