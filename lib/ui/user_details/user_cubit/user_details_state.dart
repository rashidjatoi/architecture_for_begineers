import 'package:learn_bloc/domain/entity/user.dart';

class UserDetailsState {
  final UserEntity users;

  const UserDetailsState({required this.users});

  factory UserDetailsState.initial() => UserDetailsState(
        users: UserEntity.empty(),
      );

  UserDetailsState copyWith({UserEntity? users}) =>
      UserDetailsState(users: users ?? this.users);
}
