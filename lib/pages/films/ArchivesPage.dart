import 'package:flutter/material.dart';

class ArchivesPage extends StatelessWidget {
  const ArchivesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> archives = [
      'Vidéo 1 - 12/05/2024',
      'Vidéo 2 - 18/04/2024',
      'Vidéo 3 - 02/03/2024',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Archives'),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      backgroundColor: Colors.black,
      body: archives.isEmpty
          ? const Center(
              child: Text(
                'Aucune archive disponible.',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            )
          : ListView.separated(
              itemCount: archives.length,
              separatorBuilder: (_, __) => const Divider(color: Colors.white24),
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  archives[index],
                  style: const TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.video_library, color: Colors.white70),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ouvrir ${archives[index]}')),
                  );
                },
              ),
            ),
    );
  }
}
