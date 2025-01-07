import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:learn_bloc/domain/entity/user.dart';
import 'package:learn_bloc/domain/repositories/user_repository.dart';

import '../../domain/failures/users_list_failures.dart';
import '../models/user_model.dart';

class UserImplimentation implements UserRepository {
  String kBaseUrl = 'https://jsonplaceholder.typicode.com/users';

  @override
  Future<Either<UsersListFailures, List<UserEntity>>> getAllUser() async {
    try {
      var uri = Uri.parse(kBaseUrl);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        final user = data.map((i) => User.fromJson(i).toDomain()).toList();
        log(user.toString());
        return right(user.toList());
      } else {
        return right([]);
      }
    } catch (e) {
      log(e.toString());
      return left(UsersListFailures(error: e.toString()));
    }
  }
}
