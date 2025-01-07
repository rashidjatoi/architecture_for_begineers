import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/domain/repositories/user_repository.dart';

import 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  final UserRepository userRepository;
  UserListCubit(this.userRepository) : super(UserListState.initial());

  Future<void> fetchUsers() async {
    try {
      emit(state.copyWith(isLoading: true, error: null));
      final userResponse = await userRepository.getAllUser();
      userResponse.fold((error) {
        emit(state.copyWith(error: error.error, isLoading: false));
      }, (user) {
        emit(state.copyWith(users: user, isLoading: false));
      });
    } catch (e) {
      log(e.toString());

      emit(state.copyWith(isLoading: false));
    }
  }
}
