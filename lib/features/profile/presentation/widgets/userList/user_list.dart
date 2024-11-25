import 'package:flutter/material.dart';

import '../../../domain/entities/profile.dart';
import 'user_list_item.dart';

class UserList extends StatelessWidget {
  final List<Profile> users;
  const UserList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        Profile profile = users[index];
        return UserListItem(profile: profile);
      },
    );
  }
}
