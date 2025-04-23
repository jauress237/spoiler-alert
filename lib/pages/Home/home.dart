import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/Home/widgets/header.dart';
import 'package:newtest/pages/Home/widgets/newest.dart';
import 'package:newtest/pages/home/widgets/category.dart';
import 'package:newtest/pages/home/widgets/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                // Logo et nom de l'application
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: Row(
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
                ),
                const SizedBox(height: 20),
                // Sections de contenu
                HeaderSection(),
                const SizedBox(height: 20),
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
