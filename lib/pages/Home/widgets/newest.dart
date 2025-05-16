import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/detail.dart';
import 'package:newtest/providers/theme_provider.dart';

class NewestSection extends StatelessWidget {
  NewestSection({super.key});

  final List<F_Action> f_Actions = F_Action.f_Actions();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: f_Actions.map((f_Action) => Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: themeProvider.isDarkMode ? const Color(0xFF2A2A2A) : Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              final info = Info(
                f_Action.bgImage,
                f_Action.icon,
                f_Action.name,
                f_Action.type,
                f_Action.score,
                f_Action.download,
                f_Action.review,
                f_Action.description,
                f_Action.images,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(info),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      f_Action.icon,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          f_Action.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          f_Action.type,
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ...List.generate(5, (index) => Icon(
                              Icons.star,
                              size: 16,
                              color: index < f_Action.score.floor()
                                  ? Colors.amber
                                  : Colors.grey.withOpacity(0.3),
                            )),
                            const SizedBox(width: 8),
                            Text(
                              '(${f_Action.review})',
                              style: TextStyle(
                                color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 59, 3, 3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Voir',
                      style: TextStyle(
                        color: Color.fromARGB(255, 238, 161, 161),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )).toList(),
      ),
    );
  }
}
