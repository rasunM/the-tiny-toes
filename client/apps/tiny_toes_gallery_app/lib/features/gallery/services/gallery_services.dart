import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tiny_toes_gallery_app/features/gallery/model/gallery_model.dart';

class GalleryServices {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<GalleryPhotoModel>> fetchPhotosByAlbumId(
    int albumId,
  ) async {
    final uri = Uri.parse('$_baseUrl/photos?albumId=$albumId');

    try {
      final response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'User-Agent': 'Mozilla/5.0 (compatible; Flutter)',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data
            .map((photoJson) => GalleryPhotoModel.fromJson(photoJson))
            .toList();
      } else {
        throw Exception(
          'Failed to load photos. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  
}
