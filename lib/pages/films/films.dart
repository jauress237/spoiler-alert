import 'package:flutter/material.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Films")),
      body: const Center(child: Text("Page des Films")),
    );
  }
}