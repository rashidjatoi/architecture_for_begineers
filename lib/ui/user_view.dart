import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/user_cubit/user_list_cubit.dart';
import 'package:learn_bloc/cubit/user_cubit/user_list_state.dart';
import 'package:learn_bloc/widgets/user_card.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
      ),
      body: BlocBuilder<UserListCubit, UserListState>(
        builder: (context, state) {
          // Display a loading indicator if data is being fetched.
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Display a list of user cards if users are available.
          if (state.users.isNotEmpty) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                return UserCard(user: state.users[index]);
              },
            );
          }

          // Display a placeholder if there are no users.
          return const Center(
            child: Text('No users found.'),
          );
        },
      ),
    );
  }
}
