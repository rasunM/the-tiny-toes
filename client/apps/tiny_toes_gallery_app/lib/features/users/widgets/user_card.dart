import 'package:flutter/material.dart';
import 'package:tiny_toes_gallery_app/core/theme/app_color_pallet.dart';
import 'package:tiny_toes_gallery_app/features/users/models/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: AppColorPallet.darkTouquios,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColorPallet.textGreen,
                AppColorPallet.textGreen.withAlpha(180),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 320,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColorPallet.white,
                        child: Text(
                          user.name[0],
                          style: TextStyle(
                            fontSize: 28,
                            color: AppColorPallet.darkTouquios,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            truncateWithEllipsis(20, user.name),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColorPallet.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '@${user.username}',
                            style: TextStyle(
                              color: AppColorPallet.white.withAlpha(180),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Divider(
                    height: 24,
                    color: AppColorPallet.white.withAlpha(100),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: AppColorPallet.white.withAlpha(180),
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(user.email, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: AppColorPallet.white.withAlpha(180),
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        user.phone,
                        style: TextStyle(color: AppColorPallet.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: AppColorPallet.white.withAlpha(180),
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        user.website,
                        style: TextStyle(color: AppColorPallet.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: Colors.white70, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColorPallet.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${user.address.suite}, ${user.address.street}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${user.address.city} - ${user.address.zipcode}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.business, color: Colors.white70, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColorPallet.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              user.company.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '"${user.company.catchPhrase}"',
                              style: TextStyle(
                                color: Colors.white70,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
