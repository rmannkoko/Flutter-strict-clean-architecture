import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../post_model.dart';

class GetPostByIdRemoteDatasource{
  final http.Client client;
  GetPostByIdRemoteDatasource(this.client);

  Future<PostModel> getPostById(int id) async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8'
      });
    if(response.statusCode == 200){
      return PostModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}