import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:newtest/pages/Home/home.dart';
import 'package:newtest/pages/Films/films_page.dart';
import 'package:newtest/pages/Series/series_page.dart';
import 'package:newtest/pages/Favoris/favoris_page.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'package:newtest/providers/favorites_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SPOILLER ALERT',
          theme: themeProvider.currentTheme,
          home: const MainNavigation(),
        );
      },
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FilmsPage(),
    const SeriesPage(),
    const FavorisPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    
    // Calcul de la largeur du rail en fonction de la taille de l'écran
    final railWidth = screenWidth > 1200 
        ? 250.0 
        : screenWidth > 900 
            ? 200.0 
            : screenWidth > 600 
                ? 150.0 
                : 0.0;

    return Scaffold(
      body: Row(
        children: [
          if (isLargeScreen)
            NavigationRail(
              extended: true,
              minExtendedWidth: railWidth,
              backgroundColor: const Color(0x39A42727),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedIconTheme: const IconThemeData(
                color: Colors.red,
                size: 32, // Icônes plus grandes
              ),
              unselectedIconTheme: const IconThemeData(
                color: Colors.grey,
                size: 32, // Icônes plus grandes
              ),
              selectedLabelTextStyle: const TextStyle(
                color: Colors.red,
                fontSize: 16, // Texte plus grand
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelTextStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16, // Texte plus grand
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_rounded),
                  label: Text('Accueil'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.movie_creation_rounded),
                  label: Text('Films'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.tv_rounded),
                  label: Text('Séries'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_rounded),
                  label: Text('Favoris'),
                ),
              ],
            ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isLargeScreen ? 800 : double.infinity,
                ),
                child: _pages[_selectedIndex],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isLargeScreen
          ? null
          : Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: const Color(0x39A42727),
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.grey,
                  selectedFontSize: 12,
                  unselectedFontSize: 12,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded),
                      label: 'Accueil',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.movie_creation_rounded),
                      label: 'Films',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.tv_rounded),
                      label: 'Séries',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_rounded),
                      label: 'Favoris',
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
