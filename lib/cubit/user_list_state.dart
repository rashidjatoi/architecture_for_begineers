// Import the User model to work with user-related data structures.
import 'package:learn_bloc/models/user_model.dart';

// Defines the state class for a list of users, which will be used in a BLoC (Business Logic Component) pattern.
class UserListState {
  // A list of User objects representing the current state of the user list.
  final List<User> users;

  // A boolean flag to indicate whether the data is currently being loaded.
  final bool isLoading;

  // Constructor to initialize the UserListState with required properties.
  // `users` must be provided, and `isLoading` defaults to false if not specified.
  const UserListState({required this.users, this.isLoading = false});

  // Factory constructor to create an empty state with no users and default `isLoading` value.
  factory UserListState.empty() => UserListState(users: []);

  // Method to create a new UserListState based on the current state,
  // allowing updates to `users` and/or `isLoading` while keeping other properties unchanged.
  UserListState copyWith({List<User>? users, bool? isLoading}) => UserListState(
        users: users ?? this.users, // Use the provided `users` list or retain the current one.
        isLoading: isLoading ?? this.isLoading, // Use the provided `isLoading` value or retain the current one.
      );
}
