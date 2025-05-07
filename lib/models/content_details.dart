import 'comment.dart';

class ContentDetails {
  final String title;
  final String image;
  final double rating;
  final int year;
  final String genre;
  final String description;
  final List<String> actors;
  final List<String> streamingPlatforms;
  final int? episodes;
  final int? seasons;
  final String releaseDate;
  final List<Comment> comments;

  ContentDetails({
    required this.title,
    required this.image,
    required this.rating,
    required this.year,
    required this.genre,
    required this.description,
    required this.actors,
    required this.streamingPlatforms,
    this.episodes,
    this.seasons,
    required this.releaseDate,
    this.comments = const [],
  });
} 