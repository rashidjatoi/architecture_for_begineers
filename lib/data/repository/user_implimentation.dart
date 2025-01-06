import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:learn_bloc/domain/entity/user.dart';
import 'package:learn_bloc/domain/repositories/user_repository.dart';

import '../models/user_model.dart';

class UserImplimentation implements UserRepository {
  String kBaseUrl = 'https://jsonplaceholder.typicode.com/users';

  @override
  Future<List<UserEntity>> getAllUser() async {
    try {
      var uri = Uri.parse(kBaseUrl);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        final user = data.map((i) => User.fromJson(i).toDomain()).toList();
        log(user.toString());
        return user.toList();
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
