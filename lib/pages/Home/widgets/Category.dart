import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/pages/Home/widgets/newest.dart';
import 'package:newtest/pages/Home/widgets/pupular.dart';
import 'package:newtest/pages/films/films_page.dart';
import 'package:newtest/pages/series/series_page.dart';
import 'package:newtest/providers/theme_provider.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final categories = [
    {
      'icon': Icons.movie_creation,
      'color': [Color(0xFF605CF4), Color(0xFF63A4FF)],
      'title': 'film/Action',
    },
    {
      'icon': Icons.heart_broken_rounded,
      'color': [Color(0xFFD32727), Color(0xFFFF6A6A)],
      'title': 'film/Aventure',
    },
    {
      'icon': Icons.collections,
      'color': [Color(0xFF726868), Color(0xFFB0B0B0)],
      'title': 'film/Drame',
    },
    {
      'icon': Icons.pivot_table_chart_rounded,
      'color': [Color(0xFF4391FF), Color(0xFF63E2FF)],
      'title': 'film/Horreur',
    },
    {
      'icon': Icons.sports_esports,
      'color': [Color(0xFF7182f2), Color(0xFFB388FF)],
      'title': 'film/Animation',
    },
    {
      'icon': Icons.movie_creation,
      'color': [Color(0xFF605CF4), Color(0xFF63A4FF)],
      'title': 'Serie/Action',
    },
    {
      'icon': Icons.heart_broken_rounded,
      'color': [Color(0xFFD32727), Color(0xFFFF6A6A)],
      'title': 'Serie/Aventure',
    },
    {
      'icon': Icons.collections,
      'color': [Color(0xFF726868), Color(0xFFB0B0B0)],
      'title': 'Serie/Drame',
    },
    {
      'icon': Icons.pivot_table_chart_rounded,
      'color': [Color(0xFF4391FF), Color(0xFF63E2FF)],
      'title': 'Serie/Horreur',
    },
    {
      'icon': Icons.sports_esports,
      'color': [Color(0xFF7182f2), Color(0xFFB388FF)],
      'title': 'Serie/Animation',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF181A20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Catégories
          SizedBox(
            height: 170,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final cat = categories[index];
                return _AnimatedCategoryCard(
                  icon: cat['icon'] as IconData,
                  colors: cat['color'] as List<Color>,
                  title: cat['title'] as String,
                  onTap: () {
                    if (cat['title']
                        .toString()
                        .toLowerCase()
                        .contains('serie')) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SeriesPage()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FilmsPage()),
                      );
                    }
                  },
                );
              },
            ),
          ),
          // Séparateur animé
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    Colors.redAccent,
                    Colors.amber,
                    Colors.greenAccent,
                  ],
                ),
              ),
            ),
          ),
          // POPULAIRES
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
            child: Row(
              children: const [
                Icon(Icons.local_fire_department,
                    color: Colors.amber, size: 28),
                SizedBox(width: 10),
                Text(
                  'POPULAIRES',
                  style: TextStyle(
                    color: Color(0xFFF3F3F3),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          PopularSection(),
          // NOUVEAUX
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
            child: Row(
              children: const [
                Icon(Icons.fiber_new, color: Colors.lightBlueAccent, size: 28),
                SizedBox(width: 10),
                Text(
                  'NOUVEAUX',
                  style: TextStyle(
                    color: Color(0xFFF3F3F3),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          NewestSection(),
        ],
      ),
    );
  }
}

// Widget carte catégorie animée, glass, dynamique
class _AnimatedCategoryCard extends StatefulWidget {
  final IconData icon;
  final List<Color> colors;
  final String title;
  final VoidCallback onTap;

  const _AnimatedCategoryCard({
    required this.icon,
    required this.colors,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<_AnimatedCategoryCard> createState() => _AnimatedCategoryCardState();
}

class _AnimatedCategoryCardState extends State<_AnimatedCategoryCard>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  bool _pressed = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _pressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: _pressed
              ? 0.95
              : _hovered
                  ? 1.12
                  : 1.0,
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
          child: AnimatedRotation(
            turns: _hovered ? 0.02 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color:
                        widget.colors.first.withOpacity(_hovered ? 0.35 : 0.18),
                    blurRadius: _hovered ? 32 : 18,
                    spreadRadius: _hovered ? 4 : 1,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Material(
                    color: Colors.white.withOpacity(0.07),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(32),
                      splashColor: widget.colors.first.withOpacity(0.22),
                      onTap: widget.onTap,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.all(22),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: widget.colors,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: widget.colors.first.withOpacity(0.45),
                                  blurRadius: _hovered ? 38 : 18,
                                  spreadRadius: _hovered ? 3 : 1,
                                  offset: const Offset(0, 8),
                                ),
                                if (_hovered)
                                  BoxShadow(
                                    color: widget.colors.last.withOpacity(0.22),
                                    blurRadius: 44,
                                    spreadRadius: 3,
                                    offset: const Offset(0, 0),
                                  ),
                              ],
                            ),
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return ShaderMask(
                                  shaderCallback: (rect) {
                                    return LinearGradient(
                                      colors: [
                                        Colors.white,
                                        widget.colors.last.withOpacity(0.7),
                                      ],
                                      stops: [
                                        0.2 + 0.6 * _controller.value,
                                        1.0,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(rect);
                                  },
                                  blendMode: BlendMode.srcATop,
                                  child: Icon(
                                    widget.icon,
                                    color: Colors.white,
                                    size: 48,
                                    shadows: [
                                      Shadow(
                                        color:
                                            widget.colors.last.withOpacity(0.5),
                                        blurRadius: 16,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 120,
                            child: ShaderMask(
                              shaderCallback: (rect) => LinearGradient(
                                colors: [
                                  widget.colors.first,
                                  widget.colors.last,
                                ],
                              ).createShader(rect),
                              child: Text(
                                widget.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  letterSpacing: 1.1,
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
            ),
          ),
        ),
      ),
    );
  }
}
