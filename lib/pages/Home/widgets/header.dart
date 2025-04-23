import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Section de bienvenue
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenue',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Que souhaitez-vous regarder ?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          // Menu des paramètres
          PopupMenuButton<String>(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 28,
            ),
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'theme',
                child: Row(
                  children: [
                    Icon(
                      Icons.brightness_6,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Changer de thème',
                      style: TextStyle(color: Colors.white),
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
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Mon profil',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'theme') {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              } else if (value == 'profile') {
                // Navigation vers la page de profil
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              }
            },
          ),
        ],
      ),
    );
  }
}

class Style {
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFF2A2A2A);
  static const Color textColor = Colors.white;
  static const Color greyTextColor = Color(0xFFB0B0B0);
}
