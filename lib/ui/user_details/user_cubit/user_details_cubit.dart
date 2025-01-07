import 'package:flutter_bloc/flutter_bloc.dart';

import '../user_details_initial_params.dart';
import 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsState.initial());

  void onInit(UserDetailsInitialParams initialParams) {
    emit(state.copyWith(users: initialParams.userEntity));
  }
}
