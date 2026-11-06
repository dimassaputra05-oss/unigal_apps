
class Post {
  final int id;
  final int userId;
  final String title;
  final String body;
  final List<String> tags;
  final int likes;
  final int views;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    this.tags = const [],
    this.likes = 0,
    this.views = 0,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    final reactions = json['reactions'];

    return Post(
      id: int.tryParse('${json['id'] ?? 0}') ?? 0,
      userId: int.tryParse('${json['userId'] ?? 0}') ?? 0,
      title: json['title']?.toString() ?? '',
      body: json['body']?.toString() ?? '',
      tags: (json['tags'] as List? ?? [])
          .map((tag) => tag.toString())
          .toList(),
      likes: int.tryParse(
            '${reactions is Map ? reactions['likes'] ?? 0 : 0}',
          ) ??
          0,
      views: int.tryParse('${json['views'] ?? 0}') ?? 0,
    );
  }
}
