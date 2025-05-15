import 'package:flutter/material.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/models/comment.dart';
import 'package:newtest/pages/Details/widgets/review.dart';
import 'package:newtest/models/content_details.dart';

class ReviewSection extends StatefulWidget {
  final Info info;
  const ReviewSection(this.info, {super.key});

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  final TextEditingController _commentController = TextEditingController();
  final List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    // Initialize with empty comments since Info doesn't have comments
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment() {
    if (_commentController.text.trim().isEmpty) return;

    final newComment = Comment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      contentId: widget.info.name, // Using name instead of title
      userId: 'current_user_id', // À remplacer par l'ID de l'utilisateur connecté
      username: 'Utilisateur', // À remplacer par le nom d'utilisateur
      text: _commentController.text.trim(),
      timestamp: DateTime.now(),
    );

    setState(() {
      _comments.insert(0, newComment);
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Convertir Info en ContentDetails
    final content = ContentDetails(
      title: widget.info.name,
      image: widget.info.icon,
      rating: widget.info.score.toDouble(),
      year: 2024, // Valeur par défaut
      genre: widget.info.type,
      description: widget.info.description,
      actors: [], // Liste vide par défaut
      streamingPlatforms: [], // Liste vide par défaut
      releaseDate: '', // Valeur par défaut
      comments: _comments,
    );

    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Ratings and review',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'view',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.info.score.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, size: 25, color: Colors.amber),
                      const Icon(Icons.star, size: 25, color: Colors.amber),
                      const Icon(Icons.star, size: 25, color: Colors.amber),
                      const Icon(Icons.star, size: 25, color: Colors.amber),
                      Icon(
                        Icons.star,
                        size: 25,
                        // ignore: deprecated_member_use
                        color: const Color.fromARGB(
                          255,
                          7,
                          7,
                          7,
                        ).withOpacity(0.3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${widget.info.review.toString()} review',
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          ReviewComment(content: content),
        ],
      ),
    );
  }
}
