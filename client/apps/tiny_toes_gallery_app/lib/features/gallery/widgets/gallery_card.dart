import 'package:flutter/material.dart';
import 'package:tiny_toes_gallery_app/core/theme/app_color_pallet.dart';

class GalleryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String thumbnailUrl;

  const GalleryCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.thumbnailUrl,
  });

  static const Color textGreen = AppColorPallet.textGreen;

  String safeImageUrl(String? url) {
    return (url == null || url.isEmpty) ? 'https://picsum.photos/200' : url;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('Tapped image: $imageUrl');
        // Optionally: show full screen image or navigate
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [textGreen.withOpacity(0.9), textGreen.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: textGreen.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                safeImageUrl(thumbnailUrl),
                height: 140,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColorPallet.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
