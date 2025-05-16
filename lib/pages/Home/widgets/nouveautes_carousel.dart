import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/detail.dart';

class NouveautesCarousel extends StatefulWidget {
  @override
  State<NouveautesCarousel> createState() => _NouveautesCarouselState();
}

class _NouveautesCarouselState extends State<NouveautesCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  int _currentPage = 0;

  final List<Info> _items = [
    Info(
      '../../assets/images/banner-img/banner-img-4.png',
      '../../assets/images/banner-img/banner-img-4.png',
      'Film 1',
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
      'Film 2',
      'Action',
      4.5,
      198,
      132,
      'Description du film 2',
      ['../../assets/images/banner-img/banner-img-3.png'],
    ),
    Info(
      '../../assets/images/banner-img/banner-img-2.png',
      '../../assets/images/banner-img/banner-img-2.png',
      'Film 3',
      'Action',
      4.8,
      245,
      167,
      'Description du film 3',
      ['assets/images/banner-img/banner-img-2.png'],
    ),
    Info(
      'assets/images/banner-img/banner-img-1.png',
      'assets/images/banner-img/banner-img-1.png',
      'Film 4',
      'Action',
      4.6,
      212,
      145,
      'Description du film 4',
      ['assets/images/banner-img/banner-img-1.png'],
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: Text(
        //     'Nouveautés - Films',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(_items[index]),
                    ),
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: _currentPage == index ? 0 : 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(_items[index].bgImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_items.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 18 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.red : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
} 