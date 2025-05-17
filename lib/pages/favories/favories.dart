import 'dart:ui';
import 'package:flutter/material.dart';

class FavoriesPage extends StatefulWidget {
  const FavoriesPage({super.key});

  @override
  State<FavoriesPage> createState() => _FavoriesPageState();
}

class _FavoriesPageState extends State<FavoriesPage>
    with TickerProviderStateMixin {
  final List<Map<String, dynamic>> _favs = [
    {
      'title': 'Inception',
      'image': 'assets/images/films-img/films-img-1.png',
      'type': 'Film',
      'score': 4.8,
    },
    {
      'title': 'Stranger Things',
      'image': 'assets/images/series-img/series-img-3.png',
      'type': 'Série',
      'score': 4.7,
    },
    {
      'title': 'The Witcher',
      'image': 'assets/images/series-img/series-img-6.png',
      'type': 'Série',
      'score': 4.5,
    },
    {
      'title': 'The Dark Knight',
      'image': 'assets/images/films-img/films-img-2.png',
      'type': 'Film',
      'score': 4.9,
    },
  ];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _removeFav(int index) {
    final removed = _favs.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) =>
          _buildFavTile(removed, index, animation, removing: true),
      duration: const Duration(milliseconds: 600),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Retiré des favoris : ${removed['title']}'),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }

  Widget _buildFavTile(
      Map<String, dynamic> fav, int index, Animation<double> animation,
      {bool removing = false}) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: removing ? 0.0 : 1.0,
        child: Container(
          margin: const EdgeInsets.only(bottom: 22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
            gradient: LinearGradient(
              colors: [
                index % 2 == 0
                    ? const Color(0xFF5F67EA).withOpacity(0.18)
                    : const Color(0xFFD32727).withOpacity(0.18),
                Colors.white.withOpacity(0.07),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: index % 2 == 0
                  ? const Color(0xFF5F67EA).withOpacity(0.7)
                  : const Color(0xFFD32727).withOpacity(0.7),
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                leading: Hero(
                  tag: fav['image'],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      fav['image'],
                      width: 60,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
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
                    colors: [
                      index % 2 == 0
                          ? const Color(0xFF5F67EA)
                          : const Color(0xFFD32727),
                      Colors.white,
                    ],
                  ).createShader(rect),
                  child: Text(
                    fav['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
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
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: Icon(
                          fav['type'] == 'Film' ? Icons.movie : Icons.tv,
                          key: ValueKey(fav['type']),
                          color: fav['type'] == 'Film'
                              ? const Color(0xFF5F67EA)
                              : const Color(0xFFD32727),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        fav['type'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
                          colors: [Color(0xFFFFD600), Color(0xFFFF6A00)],
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withOpacity(0.22),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star_rounded,
                              color: Colors.white, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            fav['score'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              shadows: [
                                Shadow(
                                  color: Colors.black38,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Bouton favori animé
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 1, end: 1.18),
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.elasticOut,
                      builder: (context, scale, child) => Transform.scale(
                        scale: scale,
                        child: child,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.favorite,
                            color: Colors.pinkAccent, size: 32),
                        onPressed: () => _removeFav(index),
                        splashRadius: 28,
                        tooltip: "Retirer des favoris",
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Naviguer vers la fiche détaillée si besoin
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [Color(0xFF5F67EA), Color(0xFFD32727)],
          ).createShader(rect),
          child: const Text(
            "Mes Favoris",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: 1.1,
              shadows: [
                Shadow(color: Colors.black38, blurRadius: 8),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background blur + gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF232526),
                  Color(0xFF5F67EA),
                  Color(0xFFD32727)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: Container(
              color: Colors.black.withOpacity(0.13),
            ),
          ),
          _favs.isEmpty
              ? Center(
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
                        child: Icon(Icons.favorite_border,
                            color: Colors.white.withOpacity(0.8), size: 100),
                      ),
                      const SizedBox(height: 22),
                      ShaderMask(
                        shaderCallback: (rect) => const LinearGradient(
                          colors: [Color(0xFF5F67EA), Color(0xFFD32727)],
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
                        ),
                      ),
                    ],
                  ),
                )
              : AnimatedList(
                  key: _listKey,
                  padding: const EdgeInsets.only(
                      top: 110, left: 18, right: 18, bottom: 18),
                  initialItemCount: _favs.length,
                  itemBuilder: (context, index, animation) =>
                      _buildFavTile(_favs[index], index, animation),
                ),
        ],
      ),
    );
  }
}
