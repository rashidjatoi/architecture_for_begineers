import '../entity/user.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getAllUser();
}
