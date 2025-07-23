import 'package:flutter/material.dart';
import 'package:tiny_toes_gallery_app/core/widgets/shared_app_bar.dart';
import 'package:tiny_toes_gallery_app/features/gallery/model/gallery_model.dart';
import 'package:tiny_toes_gallery_app/features/gallery/services/gallery_services.dart';
import 'package:tiny_toes_gallery_app/features/gallery/widgets/gallery_card.dart';

class GalleryPage extends StatefulWidget {
  final int albumID;
  final String albumName;

  static Route route(int albumID, String albumName) => MaterialPageRoute(
    builder: (_) => GalleryPage(albumID: albumID, albumName: albumName),
  );

  const GalleryPage({
    super.key,
    required this.albumID,
    required this.albumName,
  });

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late Future<List<GalleryPhotoModel>> _futurePhotos;

  @override
  void initState() {
    super.initState();
    _futurePhotos = GalleryServices.fetchPhotosByAlbumId(widget.albumID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(username: widget.albumName),
      body: FutureBuilder<List<GalleryPhotoModel>>(
        future: _futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No photos found.'));
          }

          final photos = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: GridView.builder(
              itemCount: photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8, // Adjust as needed
              ),
              itemBuilder: (context, index) {
                final photo = photos[index];
                return GalleryCard(
                  title: photo.title,
                  imageUrl: photo.url,
                  thumbnailUrl: photo.thumbnailUrl,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
