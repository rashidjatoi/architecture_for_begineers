import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/ui/user_details/user_cubit/user_details_state.dart';

import 'user_cubit/user_details_cubit.dart';
import 'user_details_initial_params.dart';

class UserDetailsView extends StatefulWidget {
  final UserDetailsInitialParams initialParams;
  const UserDetailsView({super.key, required this.initialParams});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  late UserDetailsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<UserDetailsCubit>(context);
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details Page')),
      body: BlocBuilder<UserDetailsCubit, UserDetailsState>(
        builder: (context, state) => Center(
          child: ListTile(
            title: Text(state.users.name.toString()),
            subtitle: Text(state.users.email.toString()),
          ),
        ),
      ),
    );
  }
}
