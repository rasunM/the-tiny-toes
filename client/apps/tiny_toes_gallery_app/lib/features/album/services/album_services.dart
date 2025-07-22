import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tiny_toes_gallery_app/features/album/models/album_model.dart';

class AlbumServices {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<AlbumModel>> fetchAlbumsByUserId(int userId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/albums?userId=$userId'),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((albumJson) => AlbumModel.fromJson(albumJson)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
