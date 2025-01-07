import 'package:learn_bloc/domain/entity/user.dart';

class UserListState {
  final List<UserEntity> users;

  final bool isLoading;
  final String? error;

  const UserListState(
      {required this.users, required this.isLoading, this.error});

  factory UserListState.empty() => UserListState(users: [], isLoading: false);

  UserListState copyWith(
          {List<UserEntity>? users, bool? isLoading, String? error}) =>
      UserListState(
        users: users ?? this.users,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );
}
