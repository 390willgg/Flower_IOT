import 'package:flower_project/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/profile.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/user_detail_card.dart';

class DetailUserPage extends StatelessWidget {
  final int userId;
  const DetailUserPage(this.userId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User $userId"),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: injection<ProfileBloc>()..add(ProfileEventGetDetailUser(userId)),
        builder: (context, state) {
          if (state is ProfileStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileStateError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is ProfileStateLoadedUser) {
            Profile profile = state.user;
            return UserDetailCard(profile: profile);
          } else {
            return const Center(
              child: Text("EMPTY USERS"),
            );
          }
        },
      ),
    );
  }
}
