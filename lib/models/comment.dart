class Comment {
  final String id;
  final String contentId;
  final String userId;
  final String username;
  final String text;
  final DateTime timestamp;

  Comment({
    required this.id,
    required this.contentId,
    required this.userId,
    required this.username,
    required this.text,
    required this.timestamp,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      contentId: json['contentId'],
      userId: json['userId'],
      username: json['username'],
      text: json['text'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'contentId': contentId,
      'userId': userId,
      'username': username,
      'text': text,
      'timestamp': timestamp.toIso8601String(),
    };
  }
} 