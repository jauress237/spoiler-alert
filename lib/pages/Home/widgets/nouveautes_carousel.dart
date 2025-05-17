import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/detail.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class NouveautesCarousel extends StatefulWidget {
  @override
  State<NouveautesCarousel> createState() => _NouveautesCarouselState();
}

class _NouveautesCarouselState extends State<NouveautesCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  int _currentPage = 0;
  late ThemeProvider themeProvider;

  final List<Info> _items = [
    Info(
      '../../assets/images/banner-img/banner-img-4.png',
      '../../assets/images/banner-img/banner-img-4.png',
      'Ma madame et Moi',
      'Action',
      4.7,
      226,
      148,
      'Description du film 1',
      ['../../assets/images/banner-img/banner-img-4.png'],
    ),
    Info(
      '../../assets/images/banner-img/banner-img-3.png',
      '../../assets/images/banner-img/banner-img-3.png',
      'Jamess Bond Agent 007',
      'Jamess Bond',
      4.5,
      198,
      132,
      'Description du film 2',
      ['../../assets/images/banner-img/banner-img-3.png'],
    ),
    Info(
      '../../assets/images/banner-img/banner-img-2.png',
      '../../assets/images/banner-img/banner-img-2.png',
      'Mission Impossible',
      'Action',
      4.8,
      245,
      167,
      'Description du film 3',
      ['../../assets/images/banner-img/banner-img-2.png'],
    ),
    Info(
      '../../assets/images/banner-img/banner-img-1.png',
      '../../assets/images/banner-img/banner-img-1.png',
      'Terminator',
      'Action',
      4.6,
      212,
      145,
      'Description du terminator',
      ['../../assets/images/banner-img/banner-img-1.png'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    final carouselHeight = isLargeScreen ? 180 * 2.5 : 180.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titre de section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Le blog sur les tendence en matiere de films et series',
            style: TextStyle(
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: carouselHeight,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final isActive = _currentPage == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOut,
                margin: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: isActive ? 0 : 22,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(_items[index]),
                      ),
                    );
                  },
                  child: AnimatedScale(
                    scale: isActive ? 1.0 : 0.93,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOut,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(isActive ? 0.32 : 0.13),
                                blurRadius: isActive ? 18 : 8,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              _items[index].bgImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200,
                            ),
                          ),
                        ),
                        // Overlay dégradé sombre
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.55),
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.25),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                        // Titre et score animés
                        Positioned(
                          left: 18,
                          bottom: 18,
                          right: 18,
                          child: AnimatedOpacity(
                            opacity: isActive ? 1 : 0.7,
                            duration: const Duration(milliseconds: 350),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    _items[index].name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black54,
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.13),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.white24),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.amber, size: 16),
                                      const SizedBox(width: 3),
                                      Text(
                                        _items[index].score.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_items.length, (index) {
            final isActive = _currentPage == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 22 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFFC5C7D) : Colors.white24,
                borderRadius: BorderRadius.circular(4),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: const Color(0xFFFC5C7D).withOpacity(0.18),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
              ),
            );
          }),
        ),
      ],
    );
  }
}
