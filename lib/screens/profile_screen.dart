import 'dart:math';

import 'package:api_app_project/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserProfileFailure)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body:state is UserProfileLoading ? CircularProgressIndicator() :

          state is UserProfileSuccess? ListView(
            children: [
              const SizedBox(height: 16),
              //! Profile Picture
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(state.user.profileImage),
              ),
              const SizedBox(height: 16),
              //! Name
              ListTile(
                title: Text(state.user.name),
                leading: const Icon(Icons.person),
              ),
              const SizedBox(height: 16),
              //! Email
              ListTile(
                title: Text(state.user.email),
                leading: const Icon(Icons.email),
              ),
              const SizedBox(height: 16),
              //! Phone number
              ListTile(
                title: Text(state.user.phone),
                leading: const Icon(Icons.phone),
              ),
              const SizedBox(height: 16),
              //! Address
              ListTile(
                title: Text(state.user.location['type']),
                leading: const Icon(Icons.location_city),
              ),
              const SizedBox(height: 16),
            ],
          ): Container(),
        );
      },
    );
  }
}
