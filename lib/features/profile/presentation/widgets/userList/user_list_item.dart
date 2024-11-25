import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/profile.dart';

class UserListItem extends StatelessWidget {
  final Profile profile;
  const UserListItem({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pushNamed(
          "detail_user",
          extra: profile.id,
        );
      },
      title: Text(profile.fullName),
    );
  }
}
