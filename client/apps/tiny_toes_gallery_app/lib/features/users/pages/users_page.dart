import 'package:flutter/material.dart';
import 'package:tiny_toes_gallery_app/core/widgets/shared_app_bar.dart';
import 'package:tiny_toes_gallery_app/features/album/pages/album_page.dart';
import 'package:tiny_toes_gallery_app/features/users/models/user_model.dart';
import 'package:tiny_toes_gallery_app/features/users/services/user_services.dart';
import 'package:tiny_toes_gallery_app/features/users/widgets/user_card.dart';

class UsersPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const UsersPage());
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<User>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = UserService().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        username: 'JohnDoe',
        onLogout: () {
          // TODO: Add logout logic here
        },
      ),
      body: FutureBuilder<List<User>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          }

          final users = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: UserCard(
                  user: users[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      AlbumPage.route(users[index].id, users[index].name),
                    );
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
