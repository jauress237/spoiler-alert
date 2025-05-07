import 'package:flutter/material.dart';
import 'package:newtest/models/content_details.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<ContentDetails> _favorites = [];

  List<ContentDetails> get favorites => _favorites;

  bool isFavorite(ContentDetails content) {
    return _favorites.any((item) => item.title == content.title);
  }

  void toggleFavorite(ContentDetails content) {
    if (isFavorite(content)) {
      _favorites.removeWhere((item) => item.title == content.title);
    } else {
      _favorites.add(content);
    }
    notifyListeners();
  }
} 