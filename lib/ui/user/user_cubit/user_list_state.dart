import 'package:learn_bloc/domain/entity/user.dart';

class UserListState {
  final List<UserEntity> users;

  final bool isLoading;

  const UserListState({required this.users, required this.isLoading});

  factory UserListState.empty() => UserListState(users: [], isLoading: false);

  UserListState copyWith({List<UserEntity>? users, bool? isLoading}) =>
      UserListState(
        users: users ?? this.users,
        isLoading: isLoading ?? this.isLoading,
      );
}
