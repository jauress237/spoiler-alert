import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/Home/widgets/newest.dart';
import 'package:newtest/pages/home/widgets/category.dart';
import 'package:newtest/pages/home/widgets/search.dart';
import 'package:newtest/pages/home/widgets/nouveautes_carousel.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'package:newtest/pages/detail/detail.dart';
import 'package:newtest/pages/recherche/search1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Arrière-plan avec effet de liquide
            Transform(
              transform: Matrix4.identity()..rotateZ(20),
              origin: const Offset(150, 50),
              child: Image.asset(
                'assets/images/bg_liquid.png',
                width: 180,
                color: themeProvider.isDarkMode ? Colors.purple.withOpacity(0.3) : Colors.purple.withOpacity(0.1),
              ),
            ),
            Positioned(
              right: 0,
              top: 10,
              child: Transform(
                transform: Matrix4.identity()..rotateZ(20),
                origin: const Offset(180, 100),
                child: Image.asset(
                  'assets/images/bg_liquid.png',
                  width: 200,
                  color: themeProvider.isDarkMode ? Colors.blue.withOpacity(0.3) : Colors.blue.withOpacity(0.1),
                ),
              ),
            ),
            // Contenu principal
            Column(
              children: [
                // Logo, nom de l'application et bouton paramètre
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo et nom de l'application
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/iconapp.jpg',
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'SPOILER ALERT',
                            style: TextStyle(
                              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                      // Boutons de recherche et paramètres
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                              size: 28,
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
                          PopupMenuButton<String>(
                            icon: Icon(
                              Icons.settings,
                              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                              size: 28,
                            ),
                            color: themeProvider.isDarkMode ? const Color(0xFF2A2A2A) : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onSelected: (value) {
                              if (value == 'theme') {
                                themeProvider.toggleTheme();
                              } else if (value == 'profile') {
                                // Navigation vers la page de profil
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem<String>(
                                value: 'theme',
                                child: Row(
                                  children: [
                                    Icon(
                                      themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      themeProvider.isDarkMode ? 'Mode Clair' : 'Mode Sombre',
                                      style: TextStyle(color: themeProvider.isDarkMode ? Colors.white : Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'profile',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Mon Profil',
                                      style: TextStyle(color: themeProvider.isDarkMode ? Colors.white : Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Carrousel de nouveautés
                NouveautesCarousel(),
                const SizedBox(height: 20),
                // Bannière principale inspirée du Microsoft Store
                _MainBanner(),
                const SizedBox(height: 20),
                // CategorySection et NewestSection restent pour l'instant
                CategorySection(),
                const SizedBox(height: 20),
                NewestSection(),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MainBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          final info = Info(
            'assets/images/moana_banner.jpg',
            'assets/images/moana_banner.jpg',
            'Moana',
            'Animation',
            4.8,
            245,
            167,
            'Description détaillée du film Moana. Une histoire captivante qui vous tiendra en haleine du début à la fin.',
            ['assets/images/moana_banner.jpg'],
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(info),
            ),
          );
        },
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage('assets/images/moana_banner.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.35),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Moana',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Louez-le aujourd\'hui',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Voir les détails'),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.85),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'A la une cette semaine',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
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
      ),
    );
  }
}
