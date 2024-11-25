import 'package:flutter/material.dart';

import '../../domain/entities/profile.dart';

class UserDetailCard extends StatelessWidget {
  final Profile profile;
  const UserDetailCard({required this.profile, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profile.profileImageUrl),
            ),
            const SizedBox(height: 20),
            Text("ID : ${profile.id}"),
            Text("Full name : ${profile.fullName}"),
            Text("Email : ${profile.email}")
          ],
        ),
      ),
    );
  }
}
