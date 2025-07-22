import 'package:flutter/material.dart';
import 'package:tiny_toes_gallery_app/core/widgets/shared_app_bar.dart';

class GalleryPage extends StatefulWidget {
  static Route route(int userId, String userName) =>
      MaterialPageRoute(builder: (_) => GalleryPage());
      
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(username: "Galery Page"),
      body: Center(child: Text("Gallery Page")),
    );
  }
}
