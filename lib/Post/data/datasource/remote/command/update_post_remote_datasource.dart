import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../post_model.dart';


class UpdatePostRemoteDataSource{
  final http.Client client;
  UpdatePostRemoteDataSource(this.client);

  Future<PostModel> updatePost(PostModel post) async{
    final response = await client.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/${post.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );
    if(response.statusCode == 200){
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }
}