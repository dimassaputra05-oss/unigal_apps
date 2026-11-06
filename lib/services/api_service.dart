
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  static const String baseUrl = 'https://dummyjson.com';

  // Mengambil semua postingan
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts?limit=30'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body);

      final List posts = data['posts'];

      return posts.map((item) {
        return Post.fromJson(item);
      }).toList();
    }

    throw Exception(
      'Gagal mengambil data: ${response.statusCode}',
    );
  }

  // Mengirim postingan baru
  Future<Post> createPost(
    String title,
    String body,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts/add'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'title': title,
        'body': body,
        'userId': 1,
      }),
    );

    if (response.statusCode == 200 ||
        response.statusCode == 201) {
      return Post.fromJson(
        jsonDecode(response.body),
      );
    }

    throw Exception(
      'Gagal mengirim data: ${response.statusCode}',
    );
  }
}
