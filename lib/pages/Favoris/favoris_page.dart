import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/models/content_details.dart';
import 'package:newtest/pages/Details/details_page.dart';
import 'package:newtest/providers/favorites_provider.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'package:newtest/pages/recherche/search1.dart';

class FavorisPage extends StatelessWidget {
  const FavorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Color(0xFF6A82FB), Color(0xFFFC5C7D)],
          ).createShader(rect),
          child: const Text(
            "Mes Favoris",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 28,
              letterSpacing: 1.2,
              shadows: [
                Shadow(color: Colors.black38, blurRadius: 8),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecherchePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF23243A),
                  Color(0xFF6A82FB),
                  Color(0xFFFC5C7D),
                  Color(0xFF23243A),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.4, 0.8, 1.0],
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
            child: Container(
              color: Colors.white.withOpacity(0.07),
            ),
          ),
          Consumer<FavoritesProvider>(
            builder: (context, favoritesProvider, child) {
              final favorites = favoritesProvider.favorites;
              if (favorites.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.7, end: 1.1),
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.elasticOut,
                        builder: (context, scale, child) => Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white.withOpacity(0.8),
                          size: 100,
                        ),
                      ),
                      const SizedBox(height: 22),
                      ShaderMask(
                        shaderCallback: (rect) => const LinearGradient(
                          colors: [Color(0xFF6A82FB), Color(0xFFFC5C7D)],
                        ).createShader(rect),
                        child: const Text(
                          "Aucun favori pour l’instant !",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Ajoute des films ou séries à ta liste pour les retrouver ici.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 30),
                      AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 800),
                        child: Icon(
                          Icons.movie_filter_rounded,
                          color: Colors.white24,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 110, left: 18, right: 18, bottom: 18),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final favori = favorites[index];
                  return _FavoriCard(
                    key: ValueKey(favori.title), // pour une animation stable
                    favori: favori,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(content: favori),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FavoriCard extends StatefulWidget {
  final ContentDetails favori;
  final VoidCallback onTap;

  const _FavoriCard({
    required this.favori,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<_FavoriCard> createState() => _FavoriCardState();
}

class _FavoriCardState extends State<_FavoriCard>
    with SingleTickerProviderStateMixin {
  bool _favorite = true;
  late AnimationController _favController;
  bool _hovering = false;
  late AnimationController _appearController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _favController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      lowerBound: 1.0,
      upperBound: 1.25,
    );
    _appearController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _appearController,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _appearController,
      curve: Curves.easeOut,
    ));
    _appearController.forward();
  }

  @override
  void dispose() {
    _favController.dispose();
    _appearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFilm = widget.favori.genre.toLowerCase().contains('film') ||
        widget.favori.genre.toLowerCase().contains('action') ||
        widget.favori.genre.toLowerCase().contains('comédie');
    final typeColor =
        isFilm ? const Color(0xFF6A82FB) : const Color(0xFFFC5C7D);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          child: AnimatedScale(
            scale: _hovering ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              margin: const EdgeInsets.only(bottom: 22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(_hovering ? 0.28 : 0.13),
                    blurRadius: _hovering ? 36 : 18,
                    offset: const Offset(0, 8),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(_hovering ? 0.22 : 0.12),
                    typeColor.withOpacity(_hovering ? 0.22 : 0.12),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: typeColor.withOpacity(_hovering ? 0.9 : 0.5),
                  width: 1.7,
                ),
              ),
              child: Stack(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    leading: Hero(
                      tag: widget.favori.image,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          widget.favori.image,
                          width: 60,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 60,
                            height: 80,
                            color: Colors.grey[800],
                            child: const Icon(Icons.broken_image,
                                color: Colors.white54),
                          ),
                        ),
                      ),
                    ),
                    title: ShaderMask(
                      shaderCallback: (rect) => LinearGradient(
                        colors: [typeColor, Colors.white],
                      ).createShader(rect),
                      child: Text(
                        widget.favori.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 1.1,
                          shadows: [
                            Shadow(color: Colors.black26, blurRadius: 4),
                          ],
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Row(
                        children: [
                          Icon(
                            isFilm ? Icons.movie : Icons.tv,
                            color: typeColor,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isFilm ? "Film" : "Série",
                            style: TextStyle(
                              color: typeColor.withOpacity(0.8),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.category,
                              color: Colors.white38, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            widget.favori.genre,
                            style: const TextStyle(
                              color: Color(0xFFB0B3C6),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Badge score stylé
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFFE29F), Color(0xFFFFB700)],
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.withOpacity(0.18),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star_rounded,
                                  color: Color(0xFFF9D923), size: 16),
                              const SizedBox(width: 4),
                              Text(
                                (widget.favori.rating != null
                                    ? widget.favori.rating.toString()
                                    : "—"),
                                style: const TextStyle(
                                  color: Color(0xFF23243A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Bouton favori animé (n'enlève plus le favori)
                        GestureDetector(
                          onTap: () async {
                            setState(() => _favorite = !_favorite);
                            await _favController.forward();
                            await _favController.reverse();
                          },
                          child: ScaleTransition(
                            scale: Tween<double>(begin: 1.0, end: 1.25).animate(
                              CurvedAnimation(
                                  parent: _favController,
                                  curve: Curves.elasticOut),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.18),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  if (_favorite)
                                    BoxShadow(
                                      color: typeColor.withOpacity(0.25),
                                      blurRadius: 14,
                                      spreadRadius: 2,
                                    ),
                                ],
                              ),
                              child: Icon(
                                _favorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: _favorite ? typeColor : Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: widget.onTap,
                  ),
                  // Effet glass sur la card
                  Positioned.fill(
                    child: IgnorePointer(
                      child: AnimatedOpacity(
                        opacity: _hovering ? 0.10 : 0.0,
                        duration: const Duration(milliseconds: 250),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
                            backgroundBlendMode: BlendMode.overlay,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
