import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../post_model.dart';

class CreatePostRemoteDatasource{

  final http.Client client;
  CreatePostRemoteDatasource(this.client);

  Future<PostModel> createPost(PostModel post) async{
    final response = await client.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );
    if(response.statusCode == 201){
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }

}