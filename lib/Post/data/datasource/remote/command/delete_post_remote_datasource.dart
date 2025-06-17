import 'package:http/http.dart' as http;

class DeletePostRemoteDataSource{
  final http.Client client;
  DeletePostRemoteDataSource(this.client);

  Future<bool> deletePost(int id) async {
    final response = await client.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );
    if(response.statusCode == 200){
      return true;
    } else {
      throw Exception('Failed to delete post');
    }
  }
}