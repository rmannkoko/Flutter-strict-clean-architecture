import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/Post/data/post_model.dart';

class GetPostRemoteDataSource {

  final http.Client client;
  GetPostRemoteDataSource(this.client);

  Future<List<PostModel>> getPosts() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8'
      }
    );
    if(response.statusCode == 200){
      final List<dynamic> posts = jsonDecode(response.body);
      return posts.map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

}
