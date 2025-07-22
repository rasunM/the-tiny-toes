import 'package:flutter/material.dart';
import 'package:tiny_toes_gallery_app/core/theme/app_color_pallet.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  final VoidCallback? onLogout;

  const SharedAppBar({super.key, required this.username, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColorPallet.backgroundColor,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColorPallet.textGreen.withValues(alpha: 40),
              ),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        "Welcome, $username",
        style: TextStyle(
          color: AppColorPallet.textGreen.withValues(alpha: 40),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.logout,
            color: AppColorPallet.textGreen.withValues(alpha: 40),
          ),
          tooltip: 'Logout',
          onPressed: onLogout ?? () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
