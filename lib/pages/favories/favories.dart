import 'package:flutter/material.dart';

class FavoriesPage extends StatelessWidget {
  const FavoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FavoriesPage")),
      body: const Center(child: Text("Page des FavoriesPage")),
    );
  }
}