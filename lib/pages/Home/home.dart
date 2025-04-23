import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/Home/widgets/newest.dart';
import 'package:newtest/pages/home/widgets/category.dart';
import 'package:newtest/pages/home/widgets/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = true;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      // Ici, vous pouvez ajouter la logique pour changer le thème de l'application
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
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
                color: Colors.purple.withOpacity(0.3),
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
                  color: Colors.blue.withOpacity(0.3),
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
                          const Text(
                            'SPOILER ALERT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                      // Bouton paramètre
                      PopupMenuButton<String>(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 28,
                        ),
                        color: const Color(0xFF2A2A2A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onSelected: (value) {
                          if (value == 'theme') {
                            _toggleTheme();
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
                                  _isDarkMode ? Icons.light_mode : Icons.dark_mode,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  _isDarkMode ? 'Mode Clair' : 'Mode Sombre',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'profile',
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Mon Profil',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Sections de contenu
                SearchSection(),
                const SizedBox(height: 20),
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
