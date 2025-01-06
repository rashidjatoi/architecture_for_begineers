// Import necessary Dart packages.
import 'dart:convert'; // For decoding JSON data.
import 'dart:developer'; // For logging purposes.

// Import the Flutter BLoC package for state management.
import 'package:flutter_bloc/flutter_bloc.dart';
// Import the HTTP package for making API requests.
import 'package:http/http.dart' as http;

// Import the User model and state classes.
import '../models/user_model.dart';
import 'user_list_state.dart';

// Define the UserListCubit class that extends Cubit to manage UserListState.
class UserListCubit extends Cubit<UserListState> {
  // Constructor initializes the Cubit with an empty state.
  UserListCubit() : super(UserListState.empty());

  // Base URL for fetching users from the JSONPlaceholder API.
  String kBaseUrl = 'https://jsonplaceholder.typicode.com/users';

  // Method to fetch users from the API.
  Future<void> fetchUsers() async {
    try {
      // Emit a new state with `isLoading` set to true to indicate loading has started.
      emit(state.copyWith(isLoading: true));

      // Parse the URL for the API endpoint.
      var uri = Uri.parse(kBaseUrl);

      // Make a GET request to fetch the user data.
      var response = await http.get(uri);

      // Check if the response status code is 200 (success).
      if (response.statusCode == 200) {
        // Decode the JSON response into a list of dynamic objects.
        var data = jsonDecode(response.body) as List;

        // Map the JSON data to a list of User objects using the `User.fromJson` method.
        final user = data.map((i) => User.fromJson(i)).toList();

        // Log the user data to the console for debugging purposes.
        log(user.toString());

        // Emit a new state with the fetched users and `isLoading` set to false.
        emit(state.copyWith(users: user, isLoading: false));
      }
    } catch (e) {
      // Log any errors that occur during the fetch process.
      log(e.toString());

      // Emit a new state with `isLoading` set to false to indicate loading has ended.
      emit(state.copyWith(isLoading: false));
    }
  }
}
