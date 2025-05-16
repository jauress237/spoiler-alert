import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/detail.dart';

class NewestSection extends StatelessWidget {
  NewestSection({super.key});

  final List<F_Action> f_Actions = F_Action.f_Actions();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children:
            f_Actions
                .map(
                  (f_Action) => GestureDetector(
                    onTap: () {
                      // Convertir F_Action en Info pour la page de détail
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
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(f_Action.icon, width: 60),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  f_Action.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          f_Action.type,
                                          style: TextStyle(
                                            color: Colors.grey.withOpacity(0.8),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.amber,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.amber,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.amber,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.amber,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.grey.withOpacity(0.3),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          59,
                                          3,
                                          3,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Text(
                                        'Ouvrir',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            238,
                                            161,
                                            161,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
