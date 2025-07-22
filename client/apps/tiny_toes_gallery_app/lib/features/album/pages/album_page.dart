import 'package:flutter/material.dart';
import 'package:tiny_toes_gallery_app/core/widgets/shared_app_bar.dart';
import 'package:tiny_toes_gallery_app/features/album/models/album_model.dart';
import 'package:tiny_toes_gallery_app/features/album/services/album_services.dart';
import 'package:tiny_toes_gallery_app/features/album/widgets/album_card.dart';
import 'package:tiny_toes_gallery_app/features/gallery/pages/gallery_page.dart';

class AlbumPage extends StatefulWidget {
  final int userId;
  final String userName;

  const AlbumPage({super.key, required this.userId, required this.userName});

  static Route route(int userId, String userName) => MaterialPageRoute(
    builder: (_) => AlbumPage(userId: userId, userName: userName),
  );

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<List<AlbumModel>> _albumsFuture;

  @override
  void initState() {
    super.initState();
    _albumsFuture = AlbumServices.fetchAlbumsByUserId(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(username: widget.userName),
      body: FutureBuilder<List<AlbumModel>>(
        future: _albumsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final albums = snapshot.data ?? [];

          if (albums.isEmpty) {
            return const Center(child: Text('No albums found.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index];
              final title = '${index + 1} .   ${album.title}';

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AlbumCard(
                  title: title,
                  onTap: () {
                    Navigator.push(context, GalleryPage.route(1, 'hii'));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
