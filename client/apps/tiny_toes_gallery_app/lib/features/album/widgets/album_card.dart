import 'package:flutter/material.dart';
import 'package:tiny_toes_gallery_app/core/theme/app_color_pallet.dart';
import 'package:tiny_toes_gallery_app/core/utils/text_utils.dart';

class AlbumCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AlbumCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                AppColorPallet.textGreen,
                AppColorPallet.textGreen.withAlpha(230),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  TextUtils.truncateWithEllipsis(35, title),
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColorPallet.white,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColorPallet.white,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
