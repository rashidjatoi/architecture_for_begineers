import 'package:dartz/dartz.dart';

import '../entity/user.dart';
import '../failures/users_list_failures.dart';

abstract class UserRepository {
  Future< Either< UsersListFailures , List<UserEntity>>> getAllUser();
}
