import 'package:flutter/material.dart';
import 'package:newtest/pages/Home/widgets/newest.dart';
import 'package:newtest/pages/Home/widgets/pupular.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final categories = [
    {
      'icon': Icons.track_changes_outlined,
      'color': const Color(0xFF605CF4),
      'title': 'Action',
    },
    {
      'icon': Icons.sports_motorsports_outlined,
      'color': const Color(0xFFFC77A6),
      'title': 'Romance',
    },
    {
      'icon': Icons.casino_outlined,
      'color': const Color(0xFF4391FF),
      'title': 'Adventure',
    },
    {
      'icon': Icons.sports_esports,
      'color': const Color(0xFF7182f2),
      'title': 'More',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            padding: const EdgeInsets.all(25),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (_, index) => Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: categories[index]['color'] as Color,
                        ),
                        child: Icon(
                          categories[index]['icon'] as IconData,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        categories[index]['title'] as String,
                        style: TextStyle(
                          color: Colors.black.withOpacity(1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
              separatorBuilder: (_, index) => const SizedBox(width: 30),
              itemCount: categories.length,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: 400,
            child: const Text(
              'Popular',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          PopularSection(),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: 410,
            child: const Text(
              'Newest',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          NewestSection(),
        ],
      ),
    );
  }
}
